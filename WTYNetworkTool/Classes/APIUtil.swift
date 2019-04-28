//
//  APIUtil.swift
//  WTYNetworkTool
//
//  Created by LTY on 04/25/2019.
//  Copyright (c) 2019 LTY. All rights reserved.
//


import Foundation
import Alamofire
import HandyJSON
import RxSwift

open class APIUtil {
    
    /*
     * 获取数据
     * - Parameters:
     * - url: 路由地址
     * - method: 请求方式
     * - parameters: 参数
     * - returnType: 返回类型
     * - Returns: 返回一个Rx序列
     */
    static public func fetchData<T: HandyJSON>(with url: String, method: HTTPMethod = .post, parameters: Parameters?, headers: HTTPHeaders?, returnType: T.Type) -> Observable<T> {
        return Observable<T>.create({ (observer: AnyObserver<T>) -> Disposable in
            self.request(observer: observer, url: url, method: method, parameters: parameters, headers: headers, returnType: returnType)
            return Disposables.create()
        })
    }
    
    /*
     * 网络请求方法
     * - Parameters:
     * - observer: Rx 观察者
     * - url: 路由地址
     * - method: 请求方式
     * - parameters: 参数
     * - returnType: 返回类型
     */
    fileprivate static func request<T: HandyJSON>(observer: AnyObserver<T>, url: String, method: HTTPMethod, parameters: Parameters?, headers: HTTPHeaders?, returnType: T.Type) {
        
        AF.request(url, method: method, parameters: parameters, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                self.successHandle(observer: observer, result: response.result, retrunType: returnType)
                break
            case .failure(let error):
                self.failHandle(observer: observer, error: APIError.apiError(with: error as NSError))
                break
            }
        }
    }
}

/*
 * 请求结果
 */
extension APIUtil {
    
    /*
     * 网络请求成功之后的回调
     * - Parameters:
     * - observer: Rx 的观察者(传递数据)
     * - result: 请求结果
     * - retrunType: 返回值类型
     */
    fileprivate static func successHandle<T: HandyJSON>(observer: AnyObserver<T>, result: AFResult<Any>, retrunType: T.Type) {
        // 如果解析出来的不是json
        if case .success(let value) = result {
            guard let jsonDic = value as? [String: Any] else {
                failHandle(observer: observer, error: APIError.dataJSON(errorMessage: "非JSON格式的数据"))
                return
            }
            // jsonDic是原始数据，将其转成HandyJSON
            guard let responseModel = retrunType.deserialize(from: NSDictionary(dictionary: jsonDic)) else {
                failHandle(observer: observer, error: APIError.dataMatch(errorMessage: "无法解析"))
                return
            }
            observer.onNext(responseModel)
            observer.onCompleted()
        }
        
    }
    
    /*
     * 网络请求失败的回调
     * - Parameters:
     * - observer: Rx 的观察者
     * - error: 错误信息
     */
    fileprivate static func failHandle<T: HandyJSON>(observer: AnyObserver<T>, error: Error) {
        observer.onError(APIError.apiError(with: error as NSError))
        observer.onCompleted()
    }
}

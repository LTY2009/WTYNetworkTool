//
//  DataModel.swift
//  WTYNetworkTool
//
//  Created by LTY on 04/25/2019.
//  Copyright (c) 2019 LTY. All rights reserved.
//

import Foundation
import HandyJSON
import RxSwift

import WTYNetworkTool

class DataModel: HandyJSON {
    var headers: SkyInfo?
    var origin: String?
    var url: String?
    
    required init() {
    }

}

class SkyInfo: HandyJSON {
    var Accept: String?
    var Host: String?
    
    required init() {
    }
}

extension DataModel {
    func fetchSkyData() -> Observable<DataModel> {
        return APIUtil.fetchData(with: Router.binURL, method: .get, parameters: nil, headers: nil, returnType: DataModel.self).map({ (response: DataModel) -> DataModel in
            return response
        })
    }
}

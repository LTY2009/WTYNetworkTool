//
//  ViewController.swift
//  WTYNetworkTool
//
//  Created by LTY on 04/25/2019.
//  Copyright (c) 2019 LTY. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import WTYNetworkTool

class ViewController: UIViewController {

    var dataModel = DataModel()

    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = UIColor.orange
        label.textAlignment = .center
        label.frame = UIScreen.main.bounds
        self.view.addSubview(label)
        
        dataModel.fetchSkyData().subscribe(onNext: { model in
            label.text = model.url
            }, onError: { (error) in
                print(error)
        }).disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


//
//  AlamfoireViewController.swift
//  News
//
//  Created by 李善武 on 2018/12/6.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit

class AlamfoireViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // HandyJSON使用方法一
        let jsonDict:[String : Any] = ["id":1,
                                       "name":"zhangsan",
                                       "sex":"man",
                                       "love":"篮球、菊花茶"]
        if let model = DictToModel.deserialize(from: jsonDict){
            print("\(model.id)  \(model.name) \(model.sex)  \(model.love))")
            print(model.toJSON())
            print("------------------")
            print(model.toJSONString())
        }
        let url = "http://httpbin.org/get"
        HttpTools.loadData(urlString: url, type: .get, parameter: nil) { (response) in
            
            guard let response = response as? [String:Any] else{
                return
            }
            
            // HandyJSON使用方法二
            if let dataModel = DataModel.deserialize(from: response) {
                
                print("args:\(dataModel.args),url:\(dataModel.url),origin:\(dataModel.origin),模型数据为:\(dataModel.headers.Host)")
            }
            
            
            
//            if let dict = dict["form"] {
//                
//                print(dict)
////                guard let dictionary = dict as? [String:Any] else{return}
////                if let str = dictionary["name"]{
////
////                    print("我的名字是:\(str)")
////                }
//            }
        }
    }
}

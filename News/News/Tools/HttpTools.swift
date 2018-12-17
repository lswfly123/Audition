//
//  HttpTools.swift
//  News
//
//  Created by 李善武 on 2018/12/5.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit
import Alamofire
enum MethodType {
    case post
    case get
    case delete
    case put
}
class HttpTools: NSObject {

    class func loadData(urlString:String,type:MethodType,parameter:[String:Any]?=nil,finishCallBack:@escaping(_ result:Any)->()) {
        
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        Alamofire.request(urlString, method: method, parameters: parameter, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            
            guard let result = response.result.value else{
                print(response.result.error)
                return
            }
            finishCallBack(result)
        }
//        Alamofire.request(urlString).responseData(completionHandler: { response in
//
//            guard let value = response.result.value else { return }
//            let result = try? JSONSerialization.jsonObject(with: value, options: [])
//            guard let res = result else { return }
//            let dictionary = res as! [String: Any]
//            finishCallBack(dictionary)
//        })
        
    
        
        let url = "http://httpbin.org/post"
//        Alamofire.request(url).responseJSON { (response) in
//
//            guard let result = response.result.value else{
//                print(response.result.error)
//                return
//            }
//            print(result)
//        }
        
        
//        Alamofire.request(url, method: .post, parameters: ["name":"lsw"], encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            guard let result = response.result.value else{
//                print(response.result.error)
//                return
//            }
//            print(result)
//        }
    }
}


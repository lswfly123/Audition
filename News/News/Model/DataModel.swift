//
//  DataModel.swift
//  News
//
//  Created by 李善武 on 2018/12/6.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit
import HandyJSON
struct DataModel: HandyJSON {

    var args:String = ""
    var origin:String = ""
    var url:String = ""
    var headers = Headers()
    
    init() {
        
    }
}

struct Headers:HandyJSON {
    
    var Accept:String = ""
    var Connection:String = ""
    var Host:String = ""
}

class DictToModel: HandyJSON {
    var id: Int!
    var name: String!
    var sex: String!
    var love: String!
    
    //必须实现
    required init() {
        
    }
}

//
//  PersonModel.swift
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit

class PersonModel: NSObject {

    @objc dynamic lazy var name:String = ""
    @objc dynamic lazy var age:Int = 0
    @objc dynamic lazy var height:Float = 1.70
    @objc dynamic lazy var isMale:Bool = true
    
    init(dict:[String:Any]){
        
        super.init()
        setValuesForKeys(dict)
    }
}

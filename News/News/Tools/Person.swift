//
//  Person.swift
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit

class Person: NSObject,NSCoding {
    
    // 使name属性具有OC的动态特性
    @objc dynamic var name:String = ""
    var height:Int = 10{
        
        willSet{
            
        }
        
        didSet{
            
            
        }
    }
    var firstName: String = "First" {
        willSet {   //新值设置之前被调用
            print("willSet的新值是\(newValue)")
        }
        didSet { //新值设置之后立即调用
            print("didSet的新值是\(oldValue)")
        }
    }
    lazy var age:Int = 0
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(firstName, forKey: "firstName")
        aCoder.encode(height, forKey: "height")
        aCoder.encode(age, forKey: "age")
    }
    
    override init() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init()
        name = aDecoder.decodeObject(forKey: "name") as! String
        firstName = aDecoder.decodeObject(forKey: "firstName") as! String
        height = aDecoder.decodeObject(forKey: "height") as! Int
        age = aDecoder.decodeObject(forKey: "age") as! Int
    }
    
    @objc dynamic func eatBreakfast() {
        
        print("正在吃早饭")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
}


class Dog :NSObject{
    
    lazy var leg:Int = 0
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
    }
}

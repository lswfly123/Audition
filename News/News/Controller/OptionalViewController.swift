//
//  OptionalViewController.swift
//  News
//
//  Created by 李善武 on 2018/12/10.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit

class OptionalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        // 1.强制解包
//        var str:String?
//        str = "强制解包"
//        if str != nil {
//
//            print(str!)
//        }
        
//        // 2.确定有值，声明的时候用！，自动解析
//        var str:String!
//        str = "强制解包"
//        if str != nil {
//            print(str)
//        }
        
//        // 3.可选绑定
//        var str:String?
//        str = "可选绑定"
//        if let str = str{
//
//            print(str)
//        }
        
        var name:String?="张三"
        var age:Int? = 18
        guard let name1 = name,let age1 = age else {
            print("name或者age有一个为nil")
            return
        }
        print("我叫\(name),今年\(age)岁")
        
        // 4.as?和as!的使用:确保转换成功时，用as!;不能确保时，用as？
        let animal:Animal? = Cat()
//        if let cat = animal as? Cat{
//            print("强转Cat类成功")
//        }
//
//        if let cat1 = animal as? Pig {}
//        print("强转失败也不会崩溃")
        
//         // 强转成功
//          let cat2 = animal as! Cat
//          print("强转成功")

//          let cat3 = animal as! Pig
//          print("强转崩溃")
        
        // 可选链取值
        let human = Human()
        let cat = Cat()
        let toy = Toy()
        human.cat = cat
        cat.toy = toy
        toy.price = 15
        print("玩具的价格是:\(human.cat?.toy?.price as! Int)元")
    }
}

class Human {
    
    var cat:Cat?
}

class Animal {
    
    
}

class Cat: Animal {
    
    var toy:Toy?
    
}

class Pig: Animal {
    
}

class Toy {
    
    var price:Int?
}

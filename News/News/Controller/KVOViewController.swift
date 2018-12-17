//
//  KVOViewController.swift
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit
// 因为swift不支持OC的动态特性，所以我们使用KVO的时候，要给被观察的属性添加动态特性：dynamic
// swift反射机制的存在：
//
private var myContext = 0
class KVOViewController: UIViewController {

    var person:Person = Person()
    var dog:Dog?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        dog = Dog()
        
        person.addObserver(dog!, forKeyPath: "name", options: [.new, .old], context:&myContext)
        
        NotificationCenter.default.addObserver(self, selector: #selector(messageTest), name: NSNotification.Name(rawValue: "message"), object: nil)
        
        // 利用反射创建一个类
        // 反射机制和工厂方法
        let str = "ViewController"
        let cls = NSClassFromString(str) as? UIViewController.Type
        let vc = cls?.init()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        person.name = "Allen"
        person.firstName = "Kobe"
        
        let dict = ["name":"lsw","age":20,"isMale":true] as [String : Any]
        let personModel = PersonModel.init(dict: dict)
        print("我的名字是:\(personModel.name)")
        
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: "message"), object: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        
    }
    
    deinit {
        person.removeObserver(dog!, forKeyPath: "name")
    }
    
    @objc func messageTest() {
        
        print("通知监听到了")
    }
}

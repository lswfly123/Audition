//
//  LSWSingleton.swift
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit
/**
 * 单例设计模式：
 *    在项目运行期间，某个类创建出来的对象只有一个
 * 为什么：
 *    1.节省内存空间
 *    2.有些对象整个运行期间，只需要一个对象(大家访问的数据对象都是同一个).UIApplation,NSUserDefault,UIDevice
 */

class LSWSingleton: NSObject {

    
}

class SingletonA{
    
    static let shareInstance = SingletonA()
}


let single = SingletonB()
class SingletonB {
    
    class var shareInstance : SingletonB {
        
        return single
    }
}

class SingletonC{
    
    static var shareInstance:SingletonC{
        struct MyStatic{
            static var instance :SingletonC = SingletonC()
        }
        return MyStatic.instance;
    }
}




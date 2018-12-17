//
//  MemoryViewController.swift
//  News
//
//  Created by 李善武 on 2018/12/7.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit

// 什么是内存管理：核心内容 MRC ARC 引用计数
// 为什么要进行内存管理:80%的崩溃时因为内存的原因造成的，所以必须重视内存问题
// 内存管理的几个方面:
//    一、循环引用：
//       1.闭包的循环引用
//       2.代理的♻️引用
//    二、对象不释放的问题：
//       1.runLoop引用定时器


/// 处理timer强引用类
public class HCWeakTimerProxy: NSObject {
    
    weak var target:NSObjectProtocol?
    var sel:Selector?
    /// required，实例化timer之后需要将timer赋值给proxy，否则就算target释放了，timer本身依然会继续运行
    public weak var timer:Timer?
    
    public required init(target:NSObjectProtocol?, sel:Selector?) {
        self.target = target
        self.sel = sel
        super.init()
        // 加强安全保护
        guard target?.responds(to: sel) == true else {
            return
        }
        // 将target的selector替换为redirectionMethod，该方法会重新处理事件
        let method = class_getInstanceMethod(self.classForCoder, #selector(HCWeakTimerProxy.redirectionMethod))!
        class_replaceMethod(self.classForCoder, sel!, method_getImplementation(method), method_getTypeEncoding(method))
    }
    
    @objc func redirectionMethod () {
        // 如果target未被释放，则调用target方法，否则释放timer
        if self.target != nil {
            self.target!.perform(self.sel)
        } else {
            self.timer?.invalidate()
            print("HCWeakProxy: invalidate timer.")
        }
    }
}

class MemoryViewController: UIViewController {

    var timer:Timer?
    var target:NSObject?
    
    
    // 推荐使用方法
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        
        loadData { [weak self] in
            
            print(self?.view)
        }
    }
    
    var completionCallBack:()->()={
        
    }
    func loadData(completion:@escaping ()->()) -> () {
        
        completionCallBack = completion
        
        // 异步
        DispatchQueue.global().async {
            self.completionCallBack()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        // 1.toParentViewController方法中将timer置为失效
//        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
//        timer?.fire()
        
        // 2.
        let proxy = HCWeakTimerProxy.init(target: self, sel: #selector(fireIMP))
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: proxy, selector: #selector(fireIMP), userInfo: nil, repeats: true)
        proxy.timer = self.timer
        
//        let target = NSObject()
//        let imp = class_getMethodImplementation(object_getClass(target), #selector(fireIMP))
//        let myClass = objc_getClass(target)
//        class_addMethod(myClass, #selector(timerCount),imp, "v:@")
        
    }

    @objc func timerCount(){
        
        print("定时器开始工作")
    }
    
    @objc func fireIMP(){
    
         NSLog("fireIMP开始运行了");
    }
    
    override func willMove(toParentViewController parent: UIViewController?) {
        
        timer?.invalidate()
        timer = nil
    }
    
    deinit {
        print("对象销毁了")
    }
}

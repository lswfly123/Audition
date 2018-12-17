//
//  SnapKitViewController.swift
//  News
//
//  Created by 李善武 on 2018/12/6.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit
import SnapKit
class SnapKitViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        let myView:UIView = UIView()
        myView.backgroundColor = UIColor.red
        view.addSubview(myView)
        myView.snp.makeConstraints { (maker) in

            maker.width.equalTo(400)
            maker.height.equalTo(200)
            maker.center.equalTo(self.view)
        }
    }
}

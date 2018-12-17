//
//  KingfisherViewController.swift
//  News
//
//  Created by 李善武 on 2018/12/6.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit
import Kingfisher
class KingfisherViewController: UIViewController {
    
    lazy var imageV : UIImageView = {
      
        let imageV:UIImageView = UIImageView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        view.addSubview(imageV)
        return imageV
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        let url = URL(string: "http://pic29.nipic.com/20130512/12428836_110546647149_2.jpg")
        imageV.kf.setImage(with: ImageResource.init(downloadURL: url!))
    }
}

//
//  ViewController.swift
//  News
//
//  Created by 李善武 on 2018/12/5.
//  Copyright © 2018年 李善武. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var tableView:UITableView = {
        
        let tableView = UITableView(frame: CGRect(x: 0, y: 64, width: view.bounds.size.width, height: view.bounds.size.height-64) , style: .plain)
        tableView.backgroundColor = UIColor.orange
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: "TipTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        view.addSubview(tableView)
        
        
//        // btn
//        let button = UIButton(type: .custom)
//        button.backgroundColor = UIColor.orange
//        button.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
//        view.addSubview(button)
//        button.snp.makeConstraints { (make) in
//            make.size.equalTo(CGSize(width: 100, height: 30))
//            make.center.equalTo(view.center)
//        }
//
//        // label
//        let bottomLabel = UILabel(frame: .zero)
//        bottomLabel.text = "bottomLabel"
//        bottomLabel.textAlignment = NSTextAlignment.center
//        bottomLabel.textColor = UIColor.white
//        bottomLabel.backgroundColor = UIColor.orange
//        view.addSubview(bottomLabel)
//        bottomLabel.snp.makeConstraints { (make) in
//            make.top.equalTo(button.snp.bottom).offset(50)
//            make.size.equalTo(CGSize(width: 200, height: 30))
//            make.centerX.equalTo(button)
//        }
//
//        NotificationCenter.default.addObserver(self, selector: #selector(messageGet), name: NSNotification.Name(rawValue: "message"), object: nil)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
//        HttpTools.loadData()
        
        NotificationCenter.default.post(Notification.init(name: Notification.Name(rawValue: "message")))
    }
    
    @objc func btnClicked() {
        
        print("按钮被点击了")
    }
    
    @objc func messageGet(){
        
        print("得到消息了")
    }
    
    
}

extension ViewController{
    
    // 代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 12
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? TipTableViewCell
        cell?.selectionStyle = .none
        tableView.separatorStyle = .none
        if indexPath.row == 0 {
            
            cell?.tipNameLb.text = "Alamofire学习"
        }else if indexPath.row == 1{
            
            cell?.tipNameLb.text = "SnapKit学习"
        }else if indexPath.row == 2{
            
            cell?.tipNameLb.text = "Kingfisher学习"
        }else if indexPath.row == 3{
            
            cell?.tipNameLb.text = "HandyJSON学习"
        }else if indexPath.row == 4{
            
            cell?.tipNameLb.text = "RxSwift学习"
        }else if indexPath.row == 5{
            
            cell?.tipNameLb.text = "内存管理"
        }else if indexPath.row == 6{
            
            cell?.tipNameLb.text = "进入OC"
        }else if indexPath.row == 7{
            
            cell?.tipNameLb.text = "KVO测试"
        }else if indexPath.row == 8{
            
            cell?.tipNameLb.text = "Runtime学习"
        }else if indexPath.row == 9{
            
            cell?.tipNameLb.text = "Block学习"
        }else if indexPath.row == 10{
            
            cell?.tipNameLb.text = "响应链"
        }else if indexPath.row == 11{
            
            cell?.tipNameLb.text = "可选类型"
        }
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let alamofireVc = AlamfoireViewController()
            navigationController?.pushViewController(alamofireVc, animated: true)
        }else if indexPath.row == 1{
            
            let snapKitVc = SnapKitViewController()
            navigationController?.pushViewController(snapKitVc, animated: true)
        } else if indexPath.row == 2{
            
            let kfinsherVc = KingfisherViewController()
            navigationController?.pushViewController(kfinsherVc, animated: true)
        }else if indexPath.row == 5{
            
            let memoryVc = MemoryViewController()
            navigationController?.pushViewController(memoryVc, animated: true)
        }else if indexPath.row == 6{
            
            let ocViewController = SwiftCallOCViewController()
            navigationController?.pushViewController(ocViewController, animated: true)
        }else if indexPath.row == 7{
            
            let kvoViewController = KVOViewController()
            navigationController?.pushViewController(kvoViewController, animated: true)
        }else if indexPath.row == 8{
            
            let runtiemVc = RuntimeViewController()
            navigationController?.pushViewController(runtiemVc, animated: true)
        }else if indexPath.row == 9{
            
            let blockVc = BlockViewController()
            navigationController?.pushViewController(blockVc, animated: true)
            
        }else if indexPath.row == 10{
            
            let responseChainVc = RespondChainViewController()
            navigationController?.pushViewController(responseChainVc, animated: true)
        }else if indexPath.row == 11{
            
            let optionalVc = OptionalViewController()
            navigationController?.pushViewController(optionalVc, animated: true)
        }
    }
}




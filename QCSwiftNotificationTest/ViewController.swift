//
//  ViewController.swift
//  QCSwiftNotificationTest
//
//  Created by EricZhang on 2018/6/14.
//  Copyright © 2018年 BYX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //放一个label显示回调信息
    var label:UILabel?;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //加一个右侧按钮
        let item = UIBarButtonItem(title:"下一页",style:UIBarButtonItemStyle.plain,target:self,action:#selector(nextBtnClicked))
        self.navigationItem.rightBarButtonItem = item
        
        self.title = "首页";
        
        
        label = UILabel();
        label?.frame = CGRect.init(x: 0, y: 64, width: self.view.frame.size.width, height: 45);
        label?.backgroundColor = UIColor.cyan;
        label?.textColor = UIColor.black;
        label?.textAlignment = .center;
        label?.text = "下一页回调内容的显示,请点击右侧下一页";
        self.view.addSubview(label!);
        
        

        //MARK:添加监听
        NotificationCenter.default.addObserver(self, selector: #selector(upDataChange(notif:)), name: NSNotification.Name(rawValue: "qctest"), object:nil);
        
        
    }
    
    //MARK:-移除通知
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK:-方法中获取回调值
    @objc func upDataChange(notif: NSNotification) {
        
        //拿到的value向下转型
//        self.label?.text = notif.object as? String;
        
        self.label?.text = notif.userInfo!["data"] as? String;
        
        
        
    }
    @objc func nextBtnClicked() -> Void {
        
        let sVC:SecondViewController = SecondViewController();

        self.navigationController?.pushViewController(sVC, animated:true);
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


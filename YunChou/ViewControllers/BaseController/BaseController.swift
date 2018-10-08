//
//  BaseController.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class BaseController: UIViewController {
    
    var leftView:UIButton = UIButton()
    let messageButton = UIButton(type:.custom)
    let searchButton = UIButton(type:.custom)
    let button =   UIButton(type: .custom)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorWhite
        //自定义返回按钮
        leftView = UIButton(type: .custom);
        leftView.frame = CGRect(x:0, y:0, width:100, height:40)
        leftView.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        button.frame = CGRect(x:0, y:2, width:22, height:25)
        button.setImage(UIImage(named:"back"), for: .normal)
        button.addTarget(self, action: #selector(backToPrevious), for: .touchUpInside)
        leftView.addSubview(button)
        leftView.isHidden = true
        let leftBarBtn = UIBarButtonItem(customView: leftView)
        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil,
                                     action: nil)
        spacer.width = -15;
        self.navigationItem.leftBarButtonItems = [spacer,leftBarBtn]
        self.creatNavButton()
    }
    
    //返回按钮点击响应
    @objc func backToPrevious(){
        self.navigationController!.popViewController(animated: true)
    }
    
    func creatNavButton() {
        //MARK: =========创建消息按钮
        messageButton.frame = CGRect(x: Main_Screen_Width-60, y: StatusBarHeight, width: 50, height: 50)
        messageButton.setImage(UIImage(named: "home_message"), for: .normal)
        messageButton.isHidden = true
        //MARK: =========创建搜索按钮
        searchButton.frame = CGRect(x: Main_Screen_Width-90, y: StatusBarHeight+8, width: 35, height: 35)
        searchButton.setImage(UIImage(named: "home_QRBlack"), for: .normal)
        searchButton.isHidden = true
        //添加搜索按钮
        self.view.addSubview(searchButton)
        //添加消息按钮
        self.view.addSubview(messageButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

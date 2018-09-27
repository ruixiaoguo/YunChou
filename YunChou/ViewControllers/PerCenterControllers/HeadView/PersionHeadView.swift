//
//  PersionHeadView.swift
//  YunChou
//
//  Created by grx on 2018/9/25.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class PersionHeadView: UIView {
    var owner = UIViewController()
    let lineView = UIView()
    let headImage = UIImageView() //头像
    let nameLable = UILabel() //名字
    let setButton = UIButton() //设置按钮
    let messageButton = UIButton() //消息按钮
    let accountView = persionAccountView() //账户
    let orderView = persionOrderView()   //订单
    let userCenterButton = UIButton() //进入个人中心按钮

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    func initUi() {
        //头像
        headImage.contentMode = .scaleAspectFill
        headImage.clipsToBounds = true
        headImage.image = UIImage(named: "def")
        self.addSubview(headImage)
        headImage.layer.cornerRadius = 25
        headImage.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        //名称
        nameLable.font = UIFont.systemFont(ofSize: 16)
        nameLable.textColor = YCColorBlack
        nameLable.text = "晓时代1997"
        self.addSubview(nameLable)
        nameLable.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.left.equalTo(headImage.snp.right).offset(15)
            make.right.equalTo(-100)
            make.height.equalTo(55)
        })
        
        //进入个人中心
        self.addSubview(userCenterButton)
        userCenterButton.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(Main_Screen_Width/2)
            make.height.equalTo(80)
        })
        userCenterButton.addTarget(self, action:#selector(userCenterClick(_:)), for:.touchUpInside)
        //消息按钮
        self.addSubview(messageButton)
        messageButton .setImage(UIImage(named:"message"), for: .normal)
        messageButton.snp.makeConstraints({ (make) in
            make.top.equalTo(30)
            make.right.equalTo(-15)
            make.width.equalTo(32)
            make.height.equalTo(28)
        })
        //设置按钮
        self.addSubview(setButton)
        setButton .setImage(UIImage(named:"setting"), for: .normal)
        setButton.snp.makeConstraints({ (make) in
            make.top.equalTo(28)
            make.right.equalTo(messageButton.snp.left).offset(-15)
            make.width.equalTo(30)
            make.height.equalTo(30)
        })
        //账户信息
        self.addSubview(accountView)
        accountView.snp.makeConstraints({ (make) in
            make.top.equalTo(headImage.snp.bottom).offset(12)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(130)
        })
        //账户信息
        self.addSubview(orderView)
        orderView.snp.makeConstraints({ (make) in
            make.top.equalTo(accountView.snp.bottom).offset(12)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(80)
        })
        //分割线
        lineView.backgroundColor = YCColorLight
        self.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(15)
            make.bottom.equalTo(self).offset(-1)
        })
    }
    
    //MARK:========个人中心入口
    @objc func userCenterClick(_ button:UIButton){
        let userCenterVC = UserCenterController()
        userCenterVC.hidesBottomBarWhenPushed = true
        self.owner.navigationController?.pushViewController(userCenterVC, animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

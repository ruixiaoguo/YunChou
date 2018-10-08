//
//  YaoqingFriendsController.swift
//  YunChou
//
//  Created by grx on 2018/9/27.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class InvitFriendController: BaseController {
 
    let bgImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "邀请有礼"
        self.view.backgroundColor = YCColorWhite
        self.leftView.isHidden = false
        self.view.addSubview(bgImage)
        bgImage.image = UIImage(named: "Yaoqing")
        bgImage.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.height.equalTo(Main_Screen_Height/2-50)
        }
        self.initInvitButton()
        self.initIvitInstruction()
    }
    
    //添加立即邀请按钮
    func initInvitButton() {
        let footView = MyFootButtonView()
        self.view.addSubview(footView)
        footView.sureOverBtn.setTitle("立即邀请", for: .normal)
        let hight:CGFloat = kWidth(R: Main_Screen_Height/2+50)
        footView.snp.makeConstraints { (make) in
            make.top.equalTo(hight)
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        footView.sureOverBtn.snp.updateConstraints { (make) in
            make.right.equalTo(-80)
            make.left.equalTo(80)
        }
        footView.sureOvercallBlock = {[unowned self]() in
            
        }
    }
    
    //添加邀请攻略
    func initIvitInstruction() {
        let bgView = UIView()
        bgView.backgroundColor = YCColorLight
        self.view.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-SafeBottomMargin)
            make.right.equalTo(-0)
            make.left.equalTo(0)
        }
        let titleLable = UILabel()
        titleLable.text = "- 邀请攻略 -"
        titleLable.textAlignment = NSTextAlignment.center
        titleLable.numberOfLines = 0
        bgView.addSubview(titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.right.equalTo(-50)
            make.left.equalTo(50)
        }
        let contentLable = UILabel()
        contentLable.text = "1.成功邀请一位好友注册的5积分，每月最多可获得50积分，好友可获得100元代金券 \n\n 2.每位好友完成第一笔>5000元的投资时，将再赠送200积分，每月无上限"
        contentLable.numberOfLines = 0
        contentLable.font = UIFont.systemFont(ofSize: 14)
        bgView.addSubview(contentLable)
        contentLable.snp.makeConstraints { (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(20)
            make.right.equalTo(-50)
            make.left.equalTo(50)
            make.bottom.equalTo(-30)
        }
        
    }
    
    

    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}

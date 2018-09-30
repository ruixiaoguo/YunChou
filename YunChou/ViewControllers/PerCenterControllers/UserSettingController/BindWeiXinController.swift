//
//  BindWeiXinController.swift
//  YunChou
//
//  Created by grx on 2018/9/30.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class BindWeiXinController: BaseController {
    let bgView = UIView()
    let weixTextFeild = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "绑定微信"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.view.addSubview(bgView)
        bgView.backgroundColor = YCColorWhite
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight+10)
            make.left.right.equalTo(0)
            make.height.equalTo(52)
        }
        self.creatUI()
    }
    
    func creatUI() {
        
        //:MARK==============绑定微信
        let weixinTitle = UILabel()
        weixinTitle.text = "微信账号"
        weixinTitle.font = YC_FONT_PFSC_Medium(14)
        weixinTitle.textColor = YCColorTitleBlack
        bgView.addSubview(weixinTitle)
        weixinTitle.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(20)
            make.width.equalTo(60)
            make.height.equalTo(52)
        }
        
        weixTextFeild.placeholder = "请输入微信账号"
        weixTextFeild.font = YC_FONT_PFSC_Medium(14)
        weixTextFeild.textColor = YCColorTitleBlack
        weixTextFeild.clearButtonMode = .never
        weixTextFeild.setModifyClearButton()
        bgView.addSubview(weixTextFeild)
        weixTextFeild.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(weixinTitle.snp.right).offset(15)
            make.right.equalTo(-20)
            make.height.equalTo(52)
        }
        self.initOverButton()
    }
    
    //绑定微信按钮
    func initOverButton() {
        let footView = MyFootButtonView()
        self.view.addSubview(footView)
        footView.backgroundColor = YCColorLight
        footView.sureOverBtn.setTitle("确定", for: .normal)
        footView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-(SafeBottomMargin+15))
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
        }
        footView.sureOverBtn.snp.updateConstraints { (make) in
            make.height.equalTo(45)
        }
        footView.sureOverBtn.layer.cornerRadius = 45/2
        footView.sureOvercallBlock = {() in
            
        }
    }
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}

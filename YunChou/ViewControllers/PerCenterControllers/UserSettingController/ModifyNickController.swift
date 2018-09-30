//
//  ModifyNickController.swift
//  YunChou
//
//  Created by grx on 2018/9/30.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class ModifyNickController: BaseController {

    var nickName: String?
    let bgView = UIView()
    let nickNameField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "修改昵称"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.view.addSubview(bgView)
        bgView.backgroundColor = YCColorWhite
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight+10)
            make.left.right.equalTo(0)
            make.height.equalTo(55)
        }
        bgView.addSubview(nickNameField)
        nickNameField.placeholder = "请输入昵称"
        nickNameField.backgroundColor = YCColorWhite
        nickNameField.clearButtonMode = .never
        nickNameField.setModifyClearButton()// 添加自定义清除按钮
        nickNameField.font = YC_FONT_PFSC_Medium(16)
        nickNameField.textColor = YCColorBlack
        nickNameField.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(55)
        }
        self.initOverButton()
    }
    //修改昵称按钮
    func initOverButton() {
        let footView = MyFootButtonView()
        self.view.addSubview(footView)
        footView.backgroundColor = YCColorLight
        footView.sureOverBtn.setTitle("提交", for: .normal)
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
        footView.sureOvercallBlock = {[unowned self]() in
            
        }
    }
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}

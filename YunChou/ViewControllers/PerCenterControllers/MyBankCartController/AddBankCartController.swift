//
//  AddBankCartController.swift
//  YunChou
//
//  Created by grx on 2018/10/24.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class AddBankCartController: BaseController {
    let bgview = AddBankCartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "添加银行卡"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.view.addSubview(bgview)
        bgview.snp.makeConstraints { (make) in
            make.top.equalTo(NaviBarHeight+10)
            make.left.right.equalTo(0)
            make.bottom.equalTo(-SafeBottomMargin-90)
        }
        self.initAddbankcartButton()
    }
    
    //MARK:=======添加银行卡按钮
    func initAddbankcartButton() {
        let footView = MyFootButtonView()
        footView.backgroundColor = YCColorLight
        self.view.addSubview(footView)
        footView.sureOverBtn.setTitle("确定", for: .normal)
        footView.snp.makeConstraints { (make) in
            make.right.equalTo(-0)
            make.left.equalTo(0)
            make.height.equalTo(60)
            make.bottom.equalTo(-SafeBottomMargin-15)
        }
        footView.sureOverBtn.snp.updateConstraints { (make) in
            make.right.equalTo(-24)
            make.left.equalTo(24)
        }
        footView.sureOvercallBlock = {() in
            self.navigationController?.popViewController(animated: true)
        }
    }

    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}

//
//  PayStyleController.swift
//  YunChou
//
//  Created by grx on 2018/10/16.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class PayStyleController: BaseController {

    var realMoneyStr = ""
    let headView = PayHeadView()
    let bottemView = PayBottomView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "支付方式"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.view.addSubview(headView)
        headView.backgroundColor = YCColorLight
        headView.snp.makeConstraints({ (make) in
            make.top.equalTo(NaviBarHeight)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(300)
        })
        headView.selectPayCallBlock = {(style:Int) in
            if style==0{
                print("选择电子钱包")
            }else if style==1{
                print("选择支付宝")
            }else if style==2{
                print("选择微信")
            }
        }
        //MARK:====bottemView
        self.view.addSubview(bottemView)
        bottemView.backgroundColor = YCColorWhite
        bottemView.snp.makeConstraints({ (make) in
            make.bottom.equalTo(-SafeBottomMargin)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(49)
        })
        bottemView.PayCallBlock = {() in
            
        }
    }

    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}

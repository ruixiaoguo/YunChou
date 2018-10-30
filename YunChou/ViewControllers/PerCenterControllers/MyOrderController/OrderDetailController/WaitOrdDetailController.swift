//
//  WaitOrdDetailController.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class WaitOrdDetailController: BaseController {
    let mainScrollView = UIScrollView()
    let orderNumLable = UILabel()
    let subLable = UILabel()
    let waitInfoView = WaitOrderInfoView()
    let subPayInfoView = SubPayInfoView()
    let waitBottemView = WaitBottemView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "订单详情"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        self.view.addSubview(mainScrollView)
        mainScrollView.frame = self.view.bounds
        mainScrollView.contentSize = CGSize(width: 0, height: 0)
        self.initUI()
    }
    
    func initUI() {
        //订单号
        let orderView = UIView(frame: CGRect(x: 0, y: 0, width: Main_Screen_Width, height: 49))
        orderView.backgroundColor = YCColorWhite
        mainScrollView.addSubview(orderView)
        orderView.addSubview(orderNumLable)
        orderNumLable.text = "订单：83747371213"
        orderNumLable.textColor = YCColorGray
        orderNumLable.font = YC_FONT_PFSC_Medium(14)
        orderNumLable.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(15)
        }
        //预约中
        orderView.addSubview(subLable)
        subLable.text = "预约中"
        subLable.textColor = YCColorStanBlue
        subLable.font = YC_FONT_PFSC_Semibold(14)
        subLable.snp.makeConstraints { (make) in
            make.right.equalTo(-15)
            make.top.equalTo(15)
        }
        //订单信息
        mainScrollView.addSubview(waitInfoView)
        waitInfoView.frame = CGRect(x: 0, y: (orderView.frame.maxY)+10, width: Main_Screen_Width, height: 132)
        //预约支付信息
        let subInfoLable = UILabel(frame: CGRect(x: 15, y: waitInfoView.frame.maxY+12, width: 100, height: 20))
        mainScrollView.addSubview(subInfoLable)
        subInfoLable.text = "预约支付信息"
        subInfoLable.textColor = YCColorBlack
        subInfoLable.font = YC_FONT_PFSC_Semibold(14)
        //订单信息
        mainScrollView.addSubview(subPayInfoView)
        subPayInfoView.frame = CGRect(x: 0, y: (subInfoLable.frame.maxY)+10, width: Main_Screen_Width, height: 145)
        //取消删除
        self.view.addSubview(waitBottemView)
        waitBottemView.frame = CGRect(x: 0, y: Main_Screen_Height-49-SafeBottomMargin, width: Main_Screen_Width, height: 49)
        
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}

//
//  MyOrderController.swift
//  YunChou
//
//  Created by grx on 2018/10/11.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit


class MyOrderController: BaseController {

    let titleArray:Array = ["待支付订单","成功订单","退款","失效"]
    let controllerArray:Array = [WaitPayViewController(),SuccessOrderController(),RefundMoneyController(),InvalidOrderController()] as [Any]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的订单"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
        let rect:CGRect = CGRect(x: 0, y: NaviBarHeight, width: Main_Screen_Width, height: Main_Screen_Height-NaviBarHeight)
        let myOrderManager = LTPageView(frame: rect, currentViewController: self, viewControllers: controllerArray as! [UIViewController], titles: titleArray, layout: self.layout)
        myOrderManager.isClickScrollAnimation = true
        self.view.addSubview(myOrderManager)
        myOrderManager.didSelectIndexBlock = {(_, index) in
            print("您点击了第\(index)页")
        }
    }
    
    //MARK:==============自定义选择条样式=============
    private lazy var layout: LTLayout = {
        let layout = LTLayout()
        layout.bottomLineHeight = 4.0
        layout.bottomLineCornerRadius = 2.0
        layout.pageBottomLineHeight = -3
        layout.titleViewBgColor = UIColor.white
        layout.scale = 1.0
        layout.titleColor = YCColorBlack
        layout.titleSelectColor = gof_ColorWithHex(0x519EF1)
        layout.titleFont = YC_FONT_PFSC_Medium(kWidth(R: 14))
        layout.bottomLineColor = YC_Color_DarkBlue
        layout.isAverage = false
        layout.lrMargin = 30
        layout.titleMargin = kWidth(R: 40)
        layout.sliderWidth = 18
        layout.sliderHeight = 50
        /* 更多属性设置请参考 LTLayout 中 public 属性说明 */
        return layout
    }()
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
    
}

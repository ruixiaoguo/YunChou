//
//  persionOrderView.swift
//  YunChou
//
//  Created by grx on 2018/9/25.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class persionOrderView: UIView {

    let imagesArray = ["myOrder","myProject","myCalendar","myAuthen"]
    let titlesArray = ["我的订单","已投项目","分红日历","实名认证"]
    var orderCallBlock:((_ tag: Int)->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initUi()
    }
    
    func initUi() {
        let width:CGFloat = (Main_Screen_Width-30)/4
        for i in 0..<imagesArray.count {
            let orderButton = UIButton()
            orderButton.tag = i+10
            self.addSubview(orderButton)
            orderButton.snp.makeConstraints ({ (make) in
                make.top.equalTo(0)
                make.left.equalTo(CGFloat(i)*width)
                make.width.equalTo(width)
                make.height.equalTo(80)
            })
            orderButton.addTarget(self, action: #selector(orderClick(_:)), for: .touchUpInside)
            let orderImage = UIImageView()
            orderImage.tag = i+100
            orderImage.image = UIImage(named: imagesArray[i])
            orderButton.addSubview(orderImage)
            orderImage.snp.makeConstraints ({ (make) in
                make.top.equalTo(5)
                make.centerX.equalTo(orderButton)
                make.width.equalTo(35)
                make.height.equalTo(35)
            })
            let orderLable = UILabel()
            orderLable.tag = i+1000
            orderLable.font = YC_FONT_PFSC_Medium(13)
            orderLable.textColor = gof_ColorWithHex(0x666666)
            orderLable.textAlignment = NSTextAlignment.center
            orderLable.text = "\(titlesArray[i])"
            orderButton.addSubview(orderLable)
            orderLable.snp.makeConstraints ({ (make) in
                make.top.equalTo(45)
                make.centerX.equalTo(orderButton)
                make.width.equalTo(100)
                make.height.equalTo(30)
            })
        }
    }
    
    @objc func orderClick(_ button:UIButton){
       orderCallBlock!(button.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

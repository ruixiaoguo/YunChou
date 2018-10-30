//
//  UnRealAuthenTipView.swift
//  YunChou
//
//  Created by grx on 2018/10/17.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class UnRealAuthenTipView: UIView {
    var unAuthenCallBlock:(()-> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = gof_RGBAColor(0,0,0,0.7)
        self.initUi()
    }
    
    func initUi(){
        let bgView = UIView()
        bgView.backgroundColor = YCColorWhite
        bgView.layer.cornerRadius = 5
        self.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(Main_Screen_Height/2-130)
            make.left.equalTo(52)
            make.right.equalTo(-52)
            make.height.equalTo(140)
        }
        let contentLable = UILabel()
        contentLable.font = YC_FONT_PFSC_Semibold(18)
        contentLable.numberOfLines = 0
        contentLable.textAlignment = NSTextAlignment.center
        contentLable.textColor = YCColorBlack
        contentLable.text = "您还未实名认证， \n请先前去认证！"
        bgView.addSubview(contentLable)
        contentLable.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView)
            make.centerY.equalTo(bgView)
        }
        //删除
        let deleteButton = UIButton()
        bgView.addSubview(deleteButton)
        deleteButton .setImage(UIImage(named:"textFiledClear"), for: .normal)
        deleteButton.snp.makeConstraints({ (make) in
            make.top.equalTo(12)
            make.right.equalTo(-12)
            make.width.equalTo(22)
            make.height.equalTo(22)
        })
        deleteButton.addTarget(self, action:#selector(deleteButtonClick(_:)), for:.touchUpInside)
        
        //稍后再说/确定
        let sureTitleArray:Array = ["稍后再说","确定"]
        let width:NSInteger = NSInteger((Main_Screen_Width-53*2-10)/2)
        for i in 0..<sureTitleArray.count {
            let sureButton = UIButton()
            sureButton.setTitle(sureTitleArray[i], for: .normal)
            sureButton.setTitleColor(YCColorWhite, for: .normal)
            sureButton.layer.cornerRadius = 45/2
            sureButton.titleLabel?.font = YC_FONT_PFSC_Semibold(16)
            sureButton.tag = i+10
            self.addSubview(sureButton)
            sureButton.snp.makeConstraints { (make) in
                make.top.equalTo(bgView.snp.bottom).offset(25)
                make.left.equalTo(54+i*(width+10))
                make.width.equalTo(width)
                make.height.equalTo(45)
            }
            if(sureButton.tag==10){
                sureButton.setSomeColors(superView: sureButton, gradientColors: [gof_ColorWithHex(0xFF8972).cgColor,gof_ColorWithHex(0xFF5463).cgColor])
            }else if(sureButton.tag==11){
                sureButton.setSomeColors(superView: sureButton, gradientColors: [gof_ColorWithHex(0x3AB2FF).cgColor,gof_ColorWithHex(0x2890FF).cgColor])
            }
            sureButton.addTarget(self, action:#selector(selButtonClick(_:)), for:.touchUpInside)
        }
    }
    
    @objc func deleteButtonClick(_ button:UIButton){
        unAuthenCallBlock!()
    }
    
    @objc func selButtonClick(_ button:UIButton){
        if(button.tag==10){
            //稍后再说
            unAuthenCallBlock!()
        }else if(button.tag==11){
            //确定
            self.removeFromSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

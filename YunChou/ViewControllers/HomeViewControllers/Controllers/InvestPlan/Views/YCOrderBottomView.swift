
//
//  YCOrderBottomView.swift
//  YunChou
//
//  Created by yy on 2018/10/9.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCOrderBottomView: UIView {

    
    typealias BtnClickBlok = () ->Void
    var orderBtnBlock:BtnClickBlok?
    
    @objc public var btnStr : String = ""{
        didSet{
            sureBtn.setTitle(btnStr, for: .normal)
        }
    }
    
    @objc public var moneyStr : String = ""{
        didSet{
            moneyLB.text = moneyStr
        }
    }
    
    private lazy var tipsLB : UILabel = {
        let tipsLB = UILabel ()
        tipsLB.textColor = YC_FontColor_45Dark
        tipsLB.font = YC_FONT_PFSC_Semibold(15)
        return tipsLB
    }()
    
    
    private lazy var moneyLB : UILabel = {
        let moneyLB = UILabel ()
        moneyLB.textColor = YC_Color_Red
        moneyLB.font = YC_FONT_PFSC_Semibold(15)
        return moneyLB
    }()
    
    private lazy var sureBtn : UIButton = {
       let sureBtn = UIButton()
        sureBtn.setTitle("确定", for: .normal)
        sureBtn.setTitleColor(UIColor.white, for: .normal)
        sureBtn.titleLabel?.font = YC_FONT_PFSC_Semibold(16)
        sureBtn.addTarget(self, action: #selector(sureBtnClickHandel), for: .touchUpInside)
        sureBtn.setSomeColors(superView: sureBtn, gradientColors: [gof_ColorWithHex(0x2890FF).cgColor,gof_ColorWithHex(0x3AB2FF).cgColor])
        return sureBtn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layer.shadowColor = YC_FontColor_45Dark.cgColor
        self.layer.shadowOpacity = 0.21
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        createSubViews()
    }
    
    @objc func sureBtnClickHandel(){
        if orderBtnBlock != nil {
            orderBtnBlock?()
        }
    }
    
    func createSubViews(){
        self.addSubview(self.tipsLB)
        tipsLB.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(-SafeBottomMargin)
            make.left.equalTo(15)
            make.width.equalTo(75)
        }
        self.addSubview(self.moneyLB)
        moneyLB.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(-SafeBottomMargin)
            make.left.equalTo(tipsLB.snp.right).offset(0)
            make.width.equalTo(180)
        }
        self.addSubview(self.sureBtn)
        sureBtn.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.bottom.equalTo(-SafeBottomMargin)
            make.right.equalTo(0)
            make.width.equalTo(131)
        }
        
        tipsLB.text = "实付金额："
        moneyLB.text = "￥3000.00"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}

//
//  AcMoneyHeadView.swift
//  YunChou
//
//  Created by grx on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class AcMoneyHeadView: UIView {

    let headBgImage = UIImageView()
    let bankCartBgView = UIView()
    let mySupMoneyBgView = UIView()
    let mySupMoneyLable = UILabel()

    var selectBankCartBlock:(()->Void)?
    var selButtonClickBlock:((_ tag:Int)->Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorLight
        self.initUi()
    }
    
    func initUi() {
        //背景图片
        headBgImage.image = UIImage(named: "AccountMoneyBg")
        self.addSubview(headBgImage)
        headBgImage.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(97)
        }
        let headTitleLable = UILabel()
        headTitleLable.text = "资金管理"
        headTitleLable.textColor = YCColorWhite
        headTitleLable.font = YC_FONT_PFSC_Semibold(20)
        headBgImage.addSubview(headTitleLable)
        headTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.top.equalTo(25)
        }
        let headDisLable = UILabel()
        headDisLable.text = "不错过每一份收益！"
        headDisLable.textColor = gof_ColorWithHex(0xB8CAFF)
        headDisLable.font = YC_FONT_PFSC_Medium(12)
        headBgImage.addSubview(headDisLable)
        headDisLable.snp.makeConstraints { (make) in
            make.top.equalTo(headTitleLable.snp.bottom).offset(5)
            make.left.equalTo(headTitleLable)
        }
        //===============创建我的银行卡====================
        self.addSubview(bankCartBgView)
        bankCartBgView.backgroundColor = YCColorWhite
        bankCartBgView.snp.makeConstraints { (make) in
            make.top.equalTo(headBgImage.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(52)
        }
        //加个手势
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectBankCartTap))
        bankCartBgView.addGestureRecognizer(gesture)
        
        let bankTitleLable = UILabel()
        bankTitleLable.text = "我的银行卡"
        bankTitleLable.textColor = YCColorTitleBlack
        bankTitleLable.font = YC_FONT_PFSC_Medium(14)
        bankCartBgView.addSubview(bankTitleLable)
        bankTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        //小箭头
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFill
        arrowImage.clipsToBounds = true
        bankCartBgView.addSubview(arrowImage)
        arrowImage.image = UIImage(named: "persionArrow")
        arrowImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-13)
            make.width.equalTo(12)
            make.height.equalTo(13)
        }
        //===============创建我的余额====================
        self.addSubview(mySupMoneyBgView)
        mySupMoneyBgView.backgroundColor = YCColorWhite
        mySupMoneyBgView.snp.makeConstraints { (make) in
            make.top.equalTo(bankCartBgView.snp.bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(205)
        }
        let supMoneyTitleLable = UILabel()
        supMoneyTitleLable.text = "我的余额"
        supMoneyTitleLable.textColor = YCColorRed
        supMoneyTitleLable.font = YC_FONT_PFSC_Semibold(16)
        mySupMoneyBgView.addSubview(supMoneyTitleLable)
        supMoneyTitleLable.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(14)
            make.top.equalTo(20)
        }
        //标签
        let tagImage = UIImageView()
        tagImage.contentMode = .scaleAspectFill
        tagImage.clipsToBounds = true
        tagImage.image = UIImage(named: "AccountTip")
        mySupMoneyBgView.addSubview(tagImage)
        tagImage.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(supMoneyTitleLable.snp.left).offset(-30)
            make.width.equalTo(23)
            make.height.equalTo(23)
        }
        //我的余额
        mySupMoneyLable.text = "￥98337.87"
        mySupMoneyLable.textColor = YCColorBlack
        mySupMoneyLable.textAlignment = NSTextAlignment.center
        mySupMoneyLable.font = YC_FONT_PFSC_Semibold(32)
        mySupMoneyBgView.addSubview(mySupMoneyLable)
        mySupMoneyLable.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(tagImage.snp.bottom).offset(20)
        }
        //充值/提现
        let chTitleArray:Array = ["充值","提现"]
        let width:NSInteger = NSInteger((Main_Screen_Width-94)/2)
        for i in 0..<chTitleArray.count {
            let selButton = UIButton()
            selButton.setTitle(chTitleArray[i], for: .normal)
            selButton.setTitleColor(YCColorRed, for: .normal)
            selButton.layer.borderWidth = 0.5
            selButton.layer.borderColor = YCColorRed.cgColor
            selButton.layer.cornerRadius = 45/2
            selButton.titleLabel?.font = YC_FONT_PFSC_Semibold(16)
            selButton.tag = i+10
            mySupMoneyBgView.addSubview(selButton)
            selButton.snp.makeConstraints { (make) in
                make.top.equalTo(mySupMoneyLable.snp.bottom).offset(20)
                make.left.equalTo(41+i*(width+12))
                make.width.equalTo(width)
                make.height.equalTo(45)
            }
            if(selButton.tag==11){
                selButton.setTitleColor(YCColorWhite, for: .normal)
                selButton.backgroundColor = YCColorRed
            }
            selButton.addTarget(selectBankCartBlock, action: #selector(selButtonClick(_:)), for: .touchUpInside)
        }
        //===============创建收支标题====================
        let detailLable = UILabel()
        detailLable.text = "收支明细"
        detailLable.textColor = YCColorTitleBlack
        detailLable.font = YC_FONT_PFSC_Semibold(14)
        self.addSubview(detailLable)
        detailLable.snp.makeConstraints { (make) in
            make.top.equalTo(mySupMoneyBgView.snp.bottom).offset(13)
            make.left.equalTo(15)
        }
        let dislLable = UILabel()
        dislLable.text = "最近30天收支明细"
        dislLable.textColor = gof_ColorWithHex(0xB4B4B4)
        dislLable.font = YC_FONT_PFSC_Medium(12)
        self.addSubview(dislLable)
        dislLable.snp.makeConstraints { (make) in
            make.top.equalTo(mySupMoneyBgView.snp.bottom).offset(13)
            make.right.equalTo(-15)
        }
    }
    
    
    @objc func selectBankCartTap(sender: UITapGestureRecognizer) {
        selectBankCartBlock!()
    }
    
    @objc func selButtonClick(_ button:UIButton){
        selButtonClickBlock!(button.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

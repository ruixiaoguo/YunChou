//
//  MyJFHeadView.swift
//  YunChou
//
//  Created by grx on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyJFHeadView: UIView {

    let headBgImage = UIImageView()
    let shopCartBgView = UIView()
    let mySupJfBgView = UIView()
    let mySupJfLable = UILabel()
    
    var selectjfShopBlock:(()->Void)?
    var selChangeClickBlock:(()->Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorLight
        self.initUi()
    }
    
    func initUi() {
        //背景图片
        headBgImage.image = UIImage(named: "BitmapBg")
        self.addSubview(headBgImage)
        headBgImage.snp.makeConstraints { (make) in
            make.left.top.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(97)
        }
        let headTitleLable = UILabel()
        headTitleLable.text = "我的积分我做主"
        headTitleLable.textColor = YCColorWhite
        headTitleLable.font = YC_FONT_PFSC_Semibold(20)
        headBgImage.addSubview(headTitleLable)
        headTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(25)
            make.top.equalTo(25)
        }
        let headDisLable = UILabel()
        headDisLable.text = "邀请好友领积分"
        headDisLable.textColor = gof_ColorWithHex(0xFFDCDC)
        headDisLable.font = YC_FONT_PFSC_Medium(12)
        headBgImage.addSubview(headDisLable)
        headDisLable.snp.makeConstraints { (make) in
            make.top.equalTo(headTitleLable.snp.bottom).offset(5)
            make.left.equalTo(headTitleLable)
        }
        //===============创建积分商城====================
        self.addSubview(shopCartBgView)
        shopCartBgView.backgroundColor = YCColorWhite
        shopCartBgView.snp.makeConstraints { (make) in
            make.top.equalTo(headBgImage.snp.bottom).offset(0)
            make.left.right.equalTo(0)
            make.height.equalTo(52)
        }
        //加个手势
        let gesture = UITapGestureRecognizer(target: self, action: #selector(selectShopCartTap))
        shopCartBgView.addGestureRecognizer(gesture)
        
        let bankTitleLable = UILabel()
        bankTitleLable.text = "积分商城"
        bankTitleLable.textColor = YCColorTitleBlack
        bankTitleLable.font = YC_FONT_PFSC_Medium(14)
        shopCartBgView.addSubview(bankTitleLable)
        bankTitleLable.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        //小箭头
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFill
        arrowImage.clipsToBounds = true
        shopCartBgView.addSubview(arrowImage)
        arrowImage.image = UIImage(named: "persionArrow")
        arrowImage.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(-13)
            make.width.equalTo(12)
            make.height.equalTo(13)
        }
        //===============创建我的积分====================
        self.addSubview(mySupJfBgView)
        mySupJfBgView.backgroundColor = YCColorWhite
        mySupJfBgView.snp.makeConstraints { (make) in
            make.top.equalTo(shopCartBgView.snp.bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(205)
        }
        let supMoneyTitleLable = UILabel()
        supMoneyTitleLable.text = "剩余积分"
        supMoneyTitleLable.textColor = YCColorRed
        supMoneyTitleLable.font = YC_FONT_PFSC_Semibold(16)
        mySupJfBgView.addSubview(supMoneyTitleLable)
        supMoneyTitleLable.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview().offset(14)
            make.top.equalTo(20)
        }
        //标签
        let tagImage = UIImageView()
        tagImage.contentMode = .scaleAspectFill
        tagImage.clipsToBounds = true
        tagImage.image = UIImage(named: "BitmapIcon")
        mySupJfBgView.addSubview(tagImage)
        tagImage.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(supMoneyTitleLable.snp.left).offset(-30)
            make.width.equalTo(23)
            make.height.equalTo(23)
        }
        //剩余积分
        mySupJfLable.text = "98337"
        mySupJfLable.textColor = YCColorBlack
        mySupJfLable.textAlignment = NSTextAlignment.center
        mySupJfLable.font = YC_FONT_PFSC_Semibold(32)
        mySupJfBgView.addSubview(mySupJfLable)
        mySupJfLable.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalTo(tagImage.snp.bottom).offset(20)
        }
        //兑换商品
        let changeButton = UIButton()
        changeButton.setTitle("兑换商品", for: .normal)
        changeButton.setTitleColor(YCColorWhite, for: .normal)
        changeButton.layer.borderWidth = 0.5
        changeButton.backgroundColor = YCColorBlue
        changeButton.layer.borderColor = YCColorBlue.cgColor
        changeButton.layer.cornerRadius = 45/2
        changeButton.titleLabel?.font = YC_FONT_PFSC_Semibold(16)
        mySupJfBgView.addSubview(changeButton)
        changeButton.snp.makeConstraints { (make) in
            make.top.equalTo(mySupJfLable.snp.bottom).offset(20)
            make.left.equalTo(41)
            make.right.equalTo(-41)
            make.height.equalTo(45)
        }
        changeButton.addTarget(self, action: #selector(changeButtonClick(_:)), for: .touchUpInside)
        //===============创建积分明细====================
        let detailLable = UILabel()
        detailLable.text = "积分明细"
        detailLable.textColor = YCColorTitleBlack
        detailLable.font = YC_FONT_PFSC_Semibold(14)
        self.addSubview(detailLable)
        detailLable.snp.makeConstraints { (make) in
            make.top.equalTo(mySupJfBgView.snp.bottom).offset(13)
            make.left.equalTo(15)
        }
        let dislLable = UILabel()
        dislLable.text = "最近30天积分明细"
        dislLable.textColor = gof_ColorWithHex(0xB4B4B4)
        dislLable.font = YC_FONT_PFSC_Medium(12)
        self.addSubview(dislLable)
        dislLable.snp.makeConstraints { (make) in
            make.top.equalTo(mySupJfBgView.snp.bottom).offset(13)
            make.right.equalTo(-15)
        }
    }
    
    
    @objc func selectShopCartTap(sender: UITapGestureRecognizer) {
        selectjfShopBlock!()
    }
    
    @objc func changeButtonClick(_ button:UIButton){
        selChangeClickBlock!()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

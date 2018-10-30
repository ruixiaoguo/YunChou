//
//  payHeadView.swift
//  YunChou
//
//  Created by grx on 2018/10/17.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class PayHeadView: UIView {

    let payMoneyBgView = UIView()
    let payMoneyLable = UILabel()

    let payDianZBgView = UIView()
    let dianZImgView = UIImageView()
    let dianZButtonView = UIButton()

    let nameLable = UILabel() //名字
    let setButton = UIButton() //设置按钮
    let messageButton = UIButton() //消息按钮
    let accountView = persionAccountView() //账户
    let orderView = persionOrderView()   //订单
    let userCenterButton = UIButton() //进入个人中心按钮
    var settingCallBlock:(()-> Void)?
    var messageCallBlock:(()-> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    func initUi() {
        //应付金额
        self.addSubview(payMoneyBgView)
        payMoneyBgView.backgroundColor = YCColorWhite
        payMoneyBgView.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(55)
        })
        let payMoneyTitleLable = UILabel()
        payMoneyTitleLable.text = "应付金额"
        payMoneyTitleLable.textColor = YCColorTitleBlack
        payMoneyTitleLable.font = YC_FONT_PFSC_Medium(14)
        payMoneyBgView.addSubview(payMoneyTitleLable)
        payMoneyTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(15)
            make.height.equalTo(55)
        })
        payMoneyLable.text = "¥300.00"
        payMoneyLable.textColor = YCColorBlack
        payMoneyLable.textAlignment = NSTextAlignment.right
        payMoneyLable.font = YC_FONT_PFSC_Medium(14)
        payMoneyBgView.addSubview(payMoneyLable)
        payMoneyLable.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.right.equalTo(-15)
            make.height.equalTo(55)
        })
        //电子钱包支付
        self.addSubview(payDianZBgView)
        payDianZBgView.backgroundColor = YCColorWhite
        payDianZBgView.snp.makeConstraints({ (make) in
            make.top.equalTo(payMoneyBgView.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(52)
        })
        //电子钱包图片
        dianZImgView.contentMode = .scaleAspectFill
        dianZImgView.clipsToBounds = true
        dianZImgView.image = UIImage(named: "def")
        payDianZBgView.addSubview(dianZImgView)
        dianZImgView.layer.cornerRadius = 15
        dianZImgView.snp.makeConstraints { (make) in
            make.top.equalTo(11)
            make.left.equalTo(15)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        let payDianZTitleLable = UILabel()
        payDianZTitleLable.text = "电子钱包"
        payDianZTitleLable.textColor = YCColorTitleBlack
        payDianZTitleLable.font = YC_FONT_PFSC_Medium(14)
        payDianZBgView.addSubview(payDianZTitleLable)
        payDianZTitleLable.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(dianZImgView.snp.right).offset(10)
            make.height.equalTo(55)
        })
        //电子钱包x选择按钮
        self.addSubview(messageButton)
        messageButton .setImage(UIImage(named:"message"), for: .normal)
        messageButton.addTarget(self, action: #selector(messageButtonClick(_ :)), for: .touchUpInside)
        messageButton.snp.makeConstraints({ (make) in
            make.top.equalTo(30)
            make.right.equalTo(-15)
            make.width.equalTo(23)
            make.height.equalTo(23)
        })
    }
    
    //MARK:========个人中心入口
//    @objc func userCenterClick(_ button:UIButton){
//        let userCenterVC = UserCenterController()
//        userCenterVC.hidesBottomBarWhenPushed = true
//        self.owner.navigationController?.pushViewController(userCenterVC, animated: true)
//    }
//
//    //MARK:========设置
//    @objc func setButtonClick(_ button:UIButton){
//        settingCallBlock!()
//    }
//
//    //MARK:========消息
//    @objc func messageButtonClick(_ button:UIButton){
//        messageCallBlock!()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

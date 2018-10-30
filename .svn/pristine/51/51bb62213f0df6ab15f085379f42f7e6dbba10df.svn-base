//
//  AddBankCartView.swift
//  YunChou
//
//  Created by grx on 2018/10/25.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class AddBankCartView: UIView {

    let userCartName = UILabel()//持卡人名字
    let bankCartNum = UITextField()//卡号
    let selectBankBtn = UIButton()//银行名字
    let smsCodeNum = UITextField()//短信验证码

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi() {
        let titleArray = ["持卡人","卡号","银行","手机号","短信验证码"]
        for i in 0..<titleArray.count {
            let titleLable = UILabel()
            titleLable.text = titleArray[i]
            titleLable.font = YC_FONT_PFSC_Medium(14)
            titleLable.textColor = YCColorTitleBlack
            self.addSubview(titleLable)
            titleLable.snp.makeConstraints { (make) in
                make.top.equalTo(15+i*50)
                make.left.equalTo(15)
            }
            let lineView = UIView()
            lineView.backgroundColor = YCColorLight
            self.addSubview(lineView)
            lineView.tag = 100+i
            lineView.snp.makeConstraints { (make) in
                make.top.equalTo(50+i*50)
                make.left.right.equalTo(0)
                make.height.equalTo(1)
            }
        }
        let lastLine:UIView = self.viewWithTag(104)!
        //标签
        let tagImage = UIImageView()
        tagImage.contentMode = .scaleAspectFill
        tagImage.clipsToBounds = true
        tagImage.image = UIImage(named: "tag")
        self.addSubview(tagImage)
        tagImage.snp.makeConstraints { (make) in
            make.top.equalTo(lastLine.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        //名称
        let tagLable = UILabel()
        tagLable.text = "银行卡用于门人账户余额提现，请确保卡片信息的真实准确!"
        tagLable.font = YC_FONT_PFSC_Regular(12)
        tagLable.numberOfLines = 0
        tagLable.textColor = YCColorStanBlue
        self.addSubview(tagLable)
        tagLable.snp.makeConstraints({ (make) in
            make.top.equalTo(lastLine.snp.bottom).offset(15)
            make.left.equalTo(tagImage.snp.right).offset(10)
            make.right.equalTo(-15)
        })
        //持卡人名字
        userCartName.text = "晓时代"
        userCartName.font = YC_FONT_PFSC_Medium(14)
        userCartName.textAlignment = NSTextAlignment.right
        userCartName.textColor = YCColorTitleBlack
        self.addSubview(userCartName)
        userCartName.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
        //卡号
        bankCartNum.placeholder = "请输入"
        bankCartNum.font = YC_FONT_PFSC_Medium(14)
        bankCartNum.textAlignment = NSTextAlignment.right
        bankCartNum.textColor = YCColorTitleBlack
        bankCartNum.keyboardType = .numberPad
        self.addSubview(bankCartNum)
        bankCartNum.snp.makeConstraints { (make) in
            make.top.equalTo(50)
            make.left.equalTo(50)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
        
        //标签
        let tipImage = UIImageView()
        tipImage.contentMode = .scaleAspectFill
        tipImage.clipsToBounds = true
        tipImage.image = UIImage(named: "persionArrow")
        self.addSubview(tipImage)
        tipImage.snp.makeConstraints { (make) in
            make.top.equalTo(117)
            make.right.equalTo(-10)
            make.width.equalTo(15)
            make.height.equalTo(15)
        }
        //银行
        selectBankBtn .setTitle("请选择", for: .normal)
        selectBankBtn .setTitleColor(YCColorLightGray, for: .normal)
        selectBankBtn .titleLabel?.font = YC_FONT_PFSC_Medium(14)
        selectBankBtn.addTarget(self, action:#selector(selectBankBtnClick(_:)), for:.touchUpInside)
        self.addSubview(selectBankBtn)
        selectBankBtn.snp.makeConstraints { (make) in
            make.top.equalTo(100)
            make.right.equalTo(tipImage.snp.left).offset(-10)
            make.height.equalTo(50)
        }
        //获取短信验证码
        let smsButton = UIButton()
        smsButton .setTitle("获取验证码", for: .normal)
        smsButton .setTitleColor(YCColorStanBlue, for: .normal)
        smsButton .titleLabel?.font = YC_FONT_PFSC_Medium(14)
        smsButton.addTarget(self, action:#selector(smsButtonClick(_:)), for:.touchUpInside)
        self.addSubview(smsButton)
        smsButton.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
        let lineView = UIView()
        lineView.backgroundColor = YCColorLight
        self.addSubview(lineView)
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(160)
            make.right.equalTo(smsButton.snp.left).offset(-15)
            make.width.equalTo(1)
            make.height.equalTo(30)
        }
        //手机号
        let phoneLable = UILabel()
        phoneLable.text = PHONEMUM()
        phoneLable.textAlignment = NSTextAlignment.right
        phoneLable.font = YC_FONT_PFSC_Medium(14)
        phoneLable.textColor = YCColorTitleBlack
        self.addSubview(phoneLable)
        phoneLable.snp.makeConstraints { (make) in
            make.top.equalTo(150)
            make.right.equalTo(lineView.snp.left).offset(-15)
            make.height.equalTo(50)
        }
        //短信验证码
        smsCodeNum.placeholder = "请输入"
        smsCodeNum.font = YC_FONT_PFSC_Medium(14)
        smsCodeNum.textAlignment = NSTextAlignment.right
        smsCodeNum.textColor = YCColorTitleBlack
        smsCodeNum.keyboardType = .numberPad
        self.addSubview(smsCodeNum)
        smsCodeNum.snp.makeConstraints { (make) in
            make.top.equalTo(200)
            make.left.equalTo(50)
            make.right.equalTo(-15)
            make.height.equalTo(50)
        }
    }
    
    //MARK:============选择银行
    @objc func selectBankBtnClick(_ sender:UIButton) {
        
    }

    //MARK:============获取验证码
    @objc func smsButtonClick(_ sender:UIButton) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bankCartNum.resignFirstResponder()
        smsCodeNum.resignFirstResponder()
    }
    
}

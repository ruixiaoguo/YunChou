//
//  WaitOrderBottemView.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class WaitBottemView: UIView {
    //取消
    private lazy var cancleButton:UIButton = UIButton()
    //付款
    private lazy var payButton:UIButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi() {
        //方案详情
        let caseImage = UIImageView()
        caseImage.image = UIImage(named: "caseImage")
        self.addSubview(caseImage)
        caseImage.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(15)
            make.width.equalTo(18)
            make.height.equalTo(20)
        }
        let caseLable = UILabel()
        caseLable.text = "方案详情"
        caseLable.font = YC_FONT_PFSC_Medium(14)
        caseLable.textColor = YCColorStanBlue
        self.addSubview(caseLable)
        caseLable.snp.makeConstraints { (make) in
            make.left.equalTo(caseImage.snp.right).offset(5)
            make.top.equalTo(15)
        }
        //付款
        self.addSubview(payButton)
        payButton .setTitle("付款", for: .normal)
        payButton .setTitleColor(YCColorWhite, for: .normal)
        payButton .backgroundColor = YCColorRed
        payButton .titleLabel?.font = YC_FONT_PFSC_Medium(15)
        payButton.layer.cornerRadius = 33/2
        payButton.layer.borderWidth = 0.5
        payButton.layer.borderColor = YCColorRed.cgColor
        //        deleteButton.addTarget(self, action: #selector(deletClick(_:)), for: .touchUpInside)
        payButton.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.right.equalTo(-15)
            make.width.equalTo(75)
            make.height.equalTo(33)
        })
        //取消
        self.addSubview(cancleButton)
        cancleButton .setTitle("取消", for: .normal)
        cancleButton .setTitleColor(YCColorTitleBlack, for: .normal)
        cancleButton .backgroundColor = YCColorWhite
        cancleButton .titleLabel?.font = YC_FONT_PFSC_Medium(15)
        cancleButton.layer.cornerRadius = 33/2
        cancleButton.layer.borderWidth = 0.5
        cancleButton.layer.borderColor = gof_ColorWithHex(0xDFDFDF).cgColor
        //        cancleButton.addTarget(self, action: #selector(deletClick(_:)), for: .touchUpInside)
        cancleButton.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.right.equalTo(payButton.snp.left).offset(-10)
            make.width.equalTo(75)
            make.height.equalTo(33)
        })
    }

}

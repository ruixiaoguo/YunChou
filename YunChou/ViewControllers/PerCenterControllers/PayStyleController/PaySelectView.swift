//
//  PaySelectView.swift
//  YunChou
//
//  Created by grx on 2018/10/17.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class PaySelectView: UIButton {
    let paySelImageView = UIImageView()
    let paySelTitleView = UILabel()
    let paySelButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        //图片
        paySelImageView.contentMode = .scaleAspectFill
        paySelImageView.clipsToBounds = true
        self.addSubview(paySelImageView)
        paySelImageView.layer.cornerRadius = 15
        paySelImageView.snp.makeConstraints { (make) in
            make.top.equalTo(11)
            make.left.equalTo(15)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        paySelTitleView.textColor = YCColorTitleBlack
        paySelTitleView.font = YC_FONT_PFSC_Medium(14)
        self.addSubview(paySelTitleView)
        paySelTitleView.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(paySelImageView.snp.right).offset(10)
            make.height.equalTo(55)
        })
        //电子钱包x选择按钮
        self.addSubview(paySelButton)
        paySelButton .setImage(UIImage(named:"paySel_norm"), for: .normal)
        paySelButton .setImage(UIImage(named:"paySel_sel"), for: .selected)
        paySelButton.snp.makeConstraints({ (make) in
            make.top.equalTo(17)
            make.right.equalTo(-15)
            make.width.equalTo(19)
            make.height.equalTo(19)
        })
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

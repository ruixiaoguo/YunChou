//
//  MyBankListCell.swift
//  YunChou
//
//  Created by grx on 2018/10/24.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyBankListCell: UITableViewCell {

    //银行卡背景图片
    private lazy var bankCartImage:UIImageView = UIImageView()
    //银行卡号
    private lazy var bankNumLable:UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = YCColorLight
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //背景图片
        bankCartImage.contentMode = .scaleAspectFill
        bankCartImage.clipsToBounds = true
        bankCartImage.layer.masksToBounds = true
        bankCartImage.image = UIImage(named: "bankCartBg")
        bankCartImage.layer.cornerRadius = 5
        contentView.addSubview(bankCartImage)
        bankCartImage.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(150)
        }
        //银行卡号
//        bankNumLable.font = YC_FONT_PFSC_Semibold(27)
//        bankNumLable.textColor = YCColorWhite
//        bankNumLable.textAlignment = NSTextAlignment.center
//        bankNumLable.text = "1234 3452 1234 1234"
//        bankCartImage.addSubview(bankNumLable)
//        bankNumLable.snp.makeConstraints({ (make) in
//            make.left.equalTo(30)
//            make.right.equalTo(-30)
//            make.bottom.equalTo(-35)
//        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

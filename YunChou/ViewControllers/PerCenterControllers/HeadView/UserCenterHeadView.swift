//
//  UserCenterHeadView.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class UserCenterHeadView: UIView {
    var owner = UIViewController()
    let lineView = UIView()
    let headImage = UIImageView() //头像
    let nameLable = UILabel() //名字
    let userLable = UILabel() //用户名字

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    func initUi() {
        
        //名称
        nameLable.font = UIFont.systemFont(ofSize: 16)
        nameLable.textColor = YCColorBlack
        nameLable.text = "头像"
        self.addSubview(nameLable)
        nameLable.snp.makeConstraints({ (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(15)
            make.right.equalTo(-150)
        })
//        //用户名称
//        userLable.font = UIFont.systemFont(ofSize: 14)
//        userLable.textColor = YCColorDarkLight
//        userLable.text = "用户名：Rsq1233412344"
//        self.addSubview(userLable)
//        userLable.snp.makeConstraints({ (make) in
//            make.top.equalTo(nameLable.snp.bottom).offset(-8)
//            make.left.equalTo(headImage.snp.right).offset(15)
//            make.right.equalTo(-100)
//        })
        //小箭头
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFill
        arrowImage.clipsToBounds = true
        self.addSubview(arrowImage)
        arrowImage.image = UIImage(named: "persionArrow")
        arrowImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(-15)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        //头像
        headImage.contentMode = .scaleAspectFill
        headImage.clipsToBounds = true
        headImage.image = UIImage(named: "def")
        self.addSubview(headImage)
        headImage.layer.cornerRadius = 55/2
        headImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(arrowImage.snp.left).offset(-10)
            make.width.equalTo(55)
            make.height.equalTo(55)
        }
        //分割线
        lineView.backgroundColor = YCColorLight
        self.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.left.equalTo(15)
            make.right.equalTo(0)
            make.height.equalTo(1)
            make.bottom.equalTo(self).offset(-1)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

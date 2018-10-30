//
//  succesLinkView.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class succesLinkView: UIView {

    let linkName = UILabel()//联系人
    let linkPhone = UILabel()//联系电话
    let linkAdress = UILabel()//联系地址
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi() {
        let titleArray:Array = ["联系人：","联系电话：","联系地址："]
        for i in 0..<titleArray.count {
            let titleLable = UILabel()
            self.addSubview(titleLable)
            titleLable.text = titleArray[i]
            titleLable.font = YC_FONT_PFSC_Medium(14)
            titleLable.textColor = YCColorTitleBlack
            titleLable.snp.makeConstraints { (make) in
                make.left.equalTo(15)
                make.top.equalTo(12+i*33)
                make.width.equalTo(100)
            }
        }
        //联系人
        self.addSubview(linkName)
        linkName.text = "晓时代"
        linkName.font = YC_FONT_PFSC_Medium(14)
        linkName.textColor = YCColorTitleBlack
        linkName.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.top.equalTo(12)
            make.right.equalTo(-15)
        }
        //联系电话
        self.addSubview(linkPhone)
        linkPhone.text = "15810662320"
        linkPhone.font = YC_FONT_PFSC_Medium(14)
        linkPhone.textColor = YCColorTitleBlack
        linkPhone.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.top.equalTo(12+33)
            make.right.equalTo(-15)
        }
        //联系地址
        self.addSubview(linkAdress)
        linkAdress.text = "北京市朝阳区东三环北路20号博瑞大厦b座506"
        linkAdress.numberOfLines = 0
        linkAdress.font = YC_FONT_PFSC_Medium(14)
        linkAdress.textColor = YCColorTitleBlack
        linkAdress.snp.makeConstraints { (make) in
            make.left.equalTo(130)
            make.top.equalTo(12+33*2)
            make.right.equalTo(-15)
        }
    }
}

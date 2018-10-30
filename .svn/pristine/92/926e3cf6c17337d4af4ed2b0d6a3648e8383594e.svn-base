//
//  SuccesBottemView.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class SuccesBottemView: UIView {

    //再来一单
    private lazy var buyAginButton:UIButton = UIButton()
    
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
        self.addSubview(buyAginButton)
        buyAginButton .setTitle("再来一单", for: .normal)
        buyAginButton .setTitleColor(YCColorRed, for: .normal)
        buyAginButton .backgroundColor = YCColorWhite
        buyAginButton .titleLabel?.font = YC_FONT_PFSC_Medium(15)
        buyAginButton.layer.cornerRadius = 33/2
        buyAginButton.layer.borderWidth = 0.5
        buyAginButton.layer.borderColor = YCColorRed.cgColor
        //        deleteButton.addTarget(self, action: #selector(deletClick(_:)), for: .touchUpInside)
        buyAginButton.snp.makeConstraints({ (make) in
            make.top.equalTo(10)
            make.right.equalTo(-15)
            make.width.equalTo(92)
            make.height.equalTo(33)
        })
    }
    
}

//
//  MyJfCell.swift
//  YunChou
//
//  Created by grx on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyJfCell: UITableViewCell {

    //名称
    private lazy var titleLabel:UILabel = UILabel()
    //日期
    private lazy var timeLable:UILabel = UILabel()
    //积分
    private lazy var jfLable:UILabel = UILabel()
    //订单
    private lazy var orderLable:UILabel = UILabel()
    
    
    private lazy var lineView:UIView = UIView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //名称
        titleLabel.text = "投资人认证"
        titleLabel.font = YC_FONT_PFSC_Semibold(16)
        titleLabel.textColor = gof_ColorWithHex(0x4899F0)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
        })
        //日期
        timeLable.text = "2018-08-14"
        timeLable.font = YC_FONT_PFSC_Medium(12)
        timeLable.textColor = gof_ColorWithHex(0xB4B4B4)
        contentView.addSubview(timeLable)
        timeLable.snp.makeConstraints({ (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(titleLabel)
        })
        //积分
        jfLable.text = "+600"
        jfLable.font = YC_FONT_PFSC_Medium(16)
        jfLable.textColor = gof_ColorWithHex(0x37B12B)
        contentView.addSubview(jfLable)
        jfLable.snp.makeConstraints({ (make) in
            make.centerY.equalToSuperview().offset(-12)
            make.right.equalTo(-15)
        })
        //订单
        orderLable.text = "订单：98384495999"
        orderLable.font = YC_FONT_PFSC_Medium(12)
        orderLable.textColor = gof_ColorWithHex(0x747474)
        contentView.addSubview(orderLable)
        orderLable.snp.makeConstraints({ (make) in
            make.top.equalTo(jfLable.snp.bottom).offset(5)
            make.right.equalTo(-15)
        })
        //分割线
        lineView.backgroundColor = YCColorLight
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(1)
            make.bottom.equalTo(contentView).offset(-1)
        })
    }
    
    internal func gaintPersionModel(model:PersionModel) {
        titleLabel.text = "\(model.title)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

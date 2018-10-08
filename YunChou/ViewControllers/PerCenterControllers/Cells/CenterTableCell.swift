//
//  CenterTableCell.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class CenterTableCell: UITableViewCell {

    private lazy var titleLabel:UILabel = UILabel()
    private lazy var descriLable:UILabel = UILabel()
    private lazy var lineView:UIView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //名称
        titleLabel.font = YC_FONT_PFSC_Semibold(14)
        titleLabel.textColor = gof_ColorWithHex(0x666666)
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(2)
            make.left.equalTo(15)
            make.width.equalTo(200)
            make.height.equalTo(55)
        })
        //分割线
        lineView.backgroundColor = YCColorLight
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.left.equalTo(15)
            make.right.equalTo(0)
            make.height.equalTo(1)
            make.bottom.equalTo(contentView).offset(-0)
        })
        //小箭头
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFill
        arrowImage.clipsToBounds = true
        contentView.addSubview(arrowImage)
        arrowImage.image = UIImage(named: "persionArrow")
        arrowImage.snp.makeConstraints { (make) in
            make.top.equalTo(18)
            make.right.equalTo(-15)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        //名称
        descriLable.font = YC_FONT_PFSC_Medium(14)
        descriLable.textColor = YCColorDarkLight
        descriLable.textAlignment = NSTextAlignment.right
        contentView.addSubview(descriLable)
        descriLable.snp.makeConstraints({ (make) in
            make.top.equalTo(2)
            make.right.equalTo(arrowImage.snp.left).offset(-12)
            make.width.equalTo(200)
            make.height.equalTo(55)
        })
    }
    
    internal func gaintPersionModel(model:PersionModel) {
        titleLabel.text = "\(model.title)"
        descriLable.text = "\(model.introduction)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  PersionTableCell.swift
//  YunChou
//
//  Created by grx on 2018/9/25.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class PersionTableCell: UITableViewCell {
    //图片
    private lazy var headImage : UIImageView = UIImageView()
    //名称
    private lazy var titleLabel:UILabel = UILabel()
    //名称
    private lazy var descriLable:UILabel = UILabel()
    
    private lazy var lineView:UIView = UIView()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //头像
        headImage.contentMode = .scaleAspectFill
        headImage.clipsToBounds = true
        contentView.addSubview(headImage)
        headImage.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        //名称
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = YCColorBlack
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(2)
            make.left.equalTo(headImage.snp.right).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(55)
        })
        //分割线
        lineView.backgroundColor = YCColorLight
        contentView.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.left.equalTo(54)
            make.right.equalTo(0)
            make.height.equalTo(1)
            make.bottom.equalTo(contentView).offset(-1)
        })
        //小箭头
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFill
        arrowImage.clipsToBounds = true
        contentView.addSubview(arrowImage)
        arrowImage.image = UIImage(named: "persionArrow")
        arrowImage.snp.makeConstraints { (make) in
            make.top.equalTo(15)
            make.right.equalTo(-15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
    }

    internal func gaintPersionModel(model:PersionModel) {
        headImage.image = UIImage(named: "\(model.image)")
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

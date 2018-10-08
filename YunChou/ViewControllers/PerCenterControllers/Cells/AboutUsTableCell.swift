//
//  AboutUsTableCell.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class AboutUsTableCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:=======客服Cell
class AboutKeFuTableCell: UITableViewCell {
    //图片
    private lazy var titleImage : UIImageView = UIImageView()
    //名称
    private lazy var titleLabel:UILabel = UILabel()
    //描述
    private lazy var contentLabel:UILabel = UILabel()
    //客服电话
    private lazy var phoneLabel:UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //图片
        titleImage.contentMode = .scaleAspectFill
        titleImage.clipsToBounds = true
        titleImage.image = UIImage(named: "kefu")
        contentView.addSubview(titleImage)
        titleImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        //名称
        titleLabel.text = "电话客服"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = YCColorBlack
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.left.equalTo(titleImage.snp.right).offset(15)
            make.width.equalTo(100)
        })
        //描述
        contentLabel.text = "周一至周五9:00-19:00"
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.textColor = YCColorDarkLight
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(titleImage.snp.right).offset(15)
            make.right.equalTo(-100)
            make.bottom.equalTo(-15)
        })
        //客服电话
        phoneLabel.text = YCKeFUPhone
        phoneLabel.font = UIFont.systemFont(ofSize: 14)
        phoneLabel.textColor = YCColorBlack
        contentView.addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(28)
            make.right.equalTo(-45)
        })
        //小箭头
        let arrowImage = UIImageView()
        arrowImage.contentMode = .scaleAspectFill
        arrowImage.clipsToBounds = true
        contentView.addSubview(arrowImage)
        arrowImage.image = UIImage(named: "persionArrow")
        arrowImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.right.equalTo(-15)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:=======邮箱Cell
class AboutEmailTableCell: UITableViewCell {
    //图片
    private lazy var titleImage : UIImageView = UIImageView()
    //名称
    private lazy var titleLabel:UILabel = UILabel()
    //描述
    private lazy var contentLabel:UILabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //图片
        titleImage.contentMode = .scaleAspectFill
        titleImage.clipsToBounds = true
        titleImage.image = UIImage(named: "email")
        contentView.addSubview(titleImage)
        titleImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        //名称
        titleLabel.text = "邮箱"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = YCColorBlack
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(titleImage.snp.right).offset(15)
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.bottom.equalTo(-15)
        })
        //描述
        contentLabel.text = "371626372@qq.com"
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.textColor = YCColorBlack
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints({ (make) in
            make.centerY.equalTo(contentView)
            make.right.equalTo(-15)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:=======地址Cell
class AboutAdressTableCell: UITableViewCell {
    //图片
    private lazy var titleImage : UIImageView = UIImageView()
    //名称
    private lazy var titleLabel:UILabel = UILabel()
    //描述
    private lazy var contentLabel:UILabel = UILabel()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //图片
        titleImage.contentMode = .scaleAspectFill
        titleImage.clipsToBounds = true
        titleImage.image = UIImage(named: "adress")
        contentView.addSubview(titleImage)
        titleImage.snp.makeConstraints { (make) in
            make.centerY.equalTo(contentView)
            make.left.equalTo(15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        //名称
        titleLabel.text = "地址"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = YCColorBlack
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.left.equalTo(titleImage.snp.right).offset(15)
            make.width.equalTo(100)
        })
        //描述
        contentLabel.text = "北京市朝阳区东三环北路28号博瑞大厦"
        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.textColor = YCColorBlack
        contentLabel.numberOfLines = 0
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.equalTo(titleImage.snp.right).offset(15)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

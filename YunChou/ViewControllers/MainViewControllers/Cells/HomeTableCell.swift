//
//  HomeTableCell.swift
//  YunChou
//
//  Created by grx on 2018/9/21.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class HomeTableCell: UITableViewCell {
    //背景层
    private lazy var bgView : UIView = UIView()
    //头像图片
    private lazy var headImage : UIImageView = UIImageView()
    //名称
    private lazy var nameLabel:UILabel = UILabel()
    //预约名称
    private lazy var apoitLabel:UILabel = UILabel()
    //内容图片
    private lazy var contentImage : UIImageView = UIImageView()
    //标题
    private lazy var titleLabel:UILabel = UILabel()
    //内容
    private lazy var contentLabel:UILabel = UILabel()
    //进度条
    //时间
    private lazy var timeLabel:UILabel = UILabel()
    //进度标签
    private lazy var speedLabel:UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /** 创建UI */
        self.InitUI()
    }

    fileprivate func InitUI(){
        //背景层
//        bgView.backgroundColor = UIColor.white
//        contentView.addSubview(bgView)
//        bgView.snp.makeConstraints { (make) in
//            make.left.equalTo(10)
//            make.right.equalTo(-10)
//            make.bottom.equalTo(contentView).offset(-10)
//        }
        //头像
        headImage.contentMode = .scaleAspectFill
        headImage.clipsToBounds = true
        headImage.image = UIImage(named: "me")
        contentView.addSubview(headImage)
        headImage.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.equalTo(15)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        //名称
        nameLabel.text = "冯思思"
        nameLabel.font = UIFont.systemFont(ofSize: 13)
        nameLabel.textColor = YCColorBlack
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(headImage.snp.right).offset(15)
            make.right.equalTo(-150)
            make.height.equalTo(46)
        })
        //预约标签
        apoitLabel.text = "预约中"
        apoitLabel.font = UIFont.systemFont(ofSize: 14)
        apoitLabel.textColor = YCColorBlack
        contentView.addSubview(apoitLabel)
        apoitLabel.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.equalTo(-20)
            make.width.equalTo(50)
            make.height.equalTo(48)
        }
        //内容图片
        contentImage.contentMode = .scaleAspectFill
        contentImage.clipsToBounds = true
        contentImage.image = UIImage(named: "bgImage")
        contentView.addSubview(contentImage)
        contentImage.snp.makeConstraints { (make) in
            make.top.equalTo(apoitLabel.snp.bottom).offset(0)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(200)
        }
        //标题
        titleLabel.text = "复华丽江国际度假世界"
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.textColor = YCColorBlack
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentImage.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-20)
            make.height.equalTo(50)
        }
        //内容
        contentLabel.text = "复华丽江国际度假世界"
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.textColor = UIColor.lightGray
        contentView.addSubview(contentLabel)
        contentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
        }
        //时间标签
        timeLabel.text = "剩余时间：23小时"
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.textColor = UIColor.blue
        contentView.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentLabel.snp.bottom).offset(20)
            make.left.equalTo(10)
            make.width.equalTo(100)
            make.bottom.equalTo(-20)
        }
    }
    
    //控制器传过来的值赋值
    internal func getTitle(contain:String){
        //标题
//        labelTitle.text = contain
    }
    
    //控制器传过来的值赋值
    internal func getIcon(contain:String){
        //标题
//        imagePhone.image = UIImage(named: contain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

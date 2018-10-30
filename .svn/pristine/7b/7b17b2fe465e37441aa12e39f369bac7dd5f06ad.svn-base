//
//  CumerInterCell.swift
//  YunChou
//
//  Created by grx on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class CumerInterCell: UITableViewCell {

    //背景图片
    private lazy var bgView : UIView = UIView()
    //优惠码
    private lazy var Yhlable : UILabel = UILabel()
    //分割线
    private lazy var line1 : UIView = UIView()
    //标题
    private lazy var titleLable : UILabel = UILabel()
    //描述
    private lazy var disLable : UILabel = UILabel()
    //分割线
    private lazy var line2 : UIView = UIView()
    //价格
    private lazy var priceLable : UILabel = UILabel()
    //满减
    private lazy var manJLable : UILabel = UILabel()
    //有效期
    private lazy var timeLable : UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = gof_ColorWithHex(0x3A84EC)
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        //背景图
        contentView.addSubview(bgView)
        bgView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(-0)
            make.bottom.equalTo(15)
        }
        //优惠码
        contentView.addSubview(Yhlable)
        Yhlable.text = "优惠码：988838919233"
        Yhlable.font = YC_FONT_PFSC_Medium(14)
        Yhlable.textColor = YCColorRed
        Yhlable.snp.makeConstraints { (make) in
            make.top.equalTo(88)
            make.left.equalTo(45)
            make.right.equalTo(-0)
        }
        //分割线
        line1.backgroundColor = YCColorLight
        contentView.addSubview(line1)
        line1.snp.makeConstraints({ (make) in
            make.top.equalTo(Yhlable.snp.bottom).offset(8)
            make.left.equalTo(23)
            make.right.equalTo(-23)
            make.height.equalTo(1)
        })
        //标题
        contentView.addSubview(titleLable)
        titleLable.text = "假日酒店优惠券"
        titleLable.font = YC_FONT_PFSC_Semibold(17)
        titleLable.textColor = YCColorBlack
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom).offset(10)
            make.left.equalTo(45)
            make.right.equalTo(-150)
        }
        //描述
        contentView.addSubview(disLable)
        disLable.text = "众筹平台通用券"
        disLable.font = YC_FONT_PFSC_Medium(14)
        disLable.textColor = YCColorTitleBlack
        disLable.snp.makeConstraints { (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.left.equalTo(45)
            make.right.equalTo(-150)
        }
        //价格
        contentView.addSubview(priceLable)
        priceLable.text = "￥100"
        priceLable.textAlignment = NSTextAlignment.center
        priceLable.font = YC_FONT_PFSC_Semibold(30)
        priceLable.textColor = YCColorRed
        priceLable.snp.makeConstraints { (make) in
            make.top.equalTo(line1.snp.bottom).offset(2)
            make.right.equalTo(-50)
        }
        //满减
        contentView.addSubview(manJLable)
        manJLable.text = " 满10000可用"
        manJLable.textAlignment = NSTextAlignment.center
        manJLable.font = YC_FONT_PFSC_Medium(14)
        manJLable.textColor = YCColorTitleBlack
        manJLable.snp.makeConstraints { (make) in
            make.top.equalTo(priceLable.snp.bottom).offset(-4)
            make.centerX.equalTo(priceLable)
        }
        //分割线
        line2.backgroundColor = YCColorLight
        contentView.addSubview(line2)
        line2.snp.makeConstraints({ (make) in
            make.top.equalTo(disLable.snp.bottom).offset(10)
            make.left.equalTo(23)
            make.right.equalTo(-23)
            make.height.equalTo(1)
        })
        //有效期
        contentView.addSubview(timeLable)
        timeLable.text = "有效期至2018-08-30至09-30"
        timeLable.font = YC_FONT_PFSC_Medium(14)
        timeLable.textColor = YCColorTitleBlack
        timeLable.snp.makeConstraints { (make) in
            make.top.equalTo(line2.snp.bottom).offset(8)
            make.left.equalTo(45)
            make.right.equalTo(-80)
        }
        //标签
        let tagImage = UIImageView()
        tagImage.contentMode = .scaleAspectFill
        tagImage.clipsToBounds = true
        tagImage.image = UIImage(named: "info")
        contentView.addSubview(tagImage)
        tagImage.snp.makeConstraints { (make) in
            make.top.equalTo(line2.snp.bottom).offset(10)
            make.right.equalTo(-50)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    internal func gaintModel(tag:NSInteger) {
        if(tag==0){
            bgView.layer.contents = UIImage(named: "CumerInterFirst")?.cgImage
            bgView.snp.updateConstraints { (make) in
                make.top.equalTo(0)
                make.left.equalTo(0)
                make.right.equalTo(-0)
            }
            Yhlable.snp.updateConstraints { (make) in
                make.top.equalTo(88)
            }
        }else{
            bgView.layer.contents = UIImage(named: "CumerInter")?.cgImage
            bgView.snp.updateConstraints { (make) in
                make.top.equalTo(-12.5)
                make.left.equalTo(8.5)
                make.right.equalTo(-11.5)
            }
            Yhlable.snp.updateConstraints { (make) in
                make.top.equalTo(18)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

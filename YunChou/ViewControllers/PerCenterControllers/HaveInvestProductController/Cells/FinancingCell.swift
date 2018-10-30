//
//  FinancingCell.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class FinancingCell: UITableViewCell {

    //背景图片
    private lazy var bgView:UIView = UIView()
    //项目名称
    private lazy var ProductName:UILabel = UILabel()
    //预约中
    private lazy var subImage = UIImageView()
    
    var subLable:UILabel = UILabel()
    //项目图片
    private lazy var productImage:UIImageView = UIImageView()
    //项目预约金额
    private lazy var surMoneyLable = UILabel()
    private lazy var realMoneyLable = UILabel()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = YCColorLight
        self.selectionStyle = .none
        /** 创建UI */
        self.InitUI()
    }
    
    fileprivate func InitUI(){
        
        contentView.addSubview(bgView)
        bgView.backgroundColor = YCColorWhite
        bgView.layer.cornerRadius = 5
        bgView.snp.makeConstraints({ (make) in
            make.top.equalTo(0)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.bottom.equalTo(-0)
//            make.height.equalTo(225)
        })
        //项目名称
        ProductName.text = "丽朗度假村项目"
        ProductName.font = YC_FONT_PFSC_Medium(14)
        ProductName.textColor = YCColorTitleBlack
        bgView.addSubview(ProductName)
        ProductName.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.left.equalTo(15)
            make.right.equalTo(-150)
        })
        //预约中
        subLable.text = "预约中"
        subLable.font = YC_FONT_PFSC_Semibold(14)
        subLable.textColor = YCColorStanBlue
        subLable.textAlignment = NSTextAlignment.right
        bgView.addSubview(subLable)
        subLable.snp.makeConstraints({ (make) in
            make.top.equalTo(15)
            make.right.equalTo(-15)
        })
        
        //分割线
        let lineView = UIView()
        lineView.backgroundColor = YCColorLight
        bgView.addSubview(lineView)
        lineView.snp.makeConstraints({ (make) in
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(1)
            make.top.equalTo(subLable).offset(30)
        })
        
        
        //项目图片
        productImage.image = UIImage(named: "bgImage")
        bgView.addSubview(productImage)
        productImage.layer.cornerRadius = 5
        productImage.layer.masksToBounds = true
        productImage.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.width.equalTo(100)
            make.height.equalTo(100)
        })
        
        //预约方案
        let titleArray:Array = ["股权方案1","股权方案2","股权方案3"]
        let numArray:Array = ["× 5份","× 6份","× 10份"]

        for i in 0..<titleArray.count {
            //标题
            let content = UILabel()
            content.text = titleArray[i]
            content.font = YC_FONT_PFSC_Semibold(14)
            content.numberOfLines = 0
            content.textColor = YCColorTitleBlack
            content.tag = i+10
            bgView.addSubview(content)
            content.snp.makeConstraints({ (make) in
                make.top.equalTo(lineView.snp.bottom).offset(20+i*33)
                make.left.equalTo(productImage.snp.right).offset(15)
                make.right.equalTo(-100)
            })
            if(titleArray.count==1){
                content.snp.updateConstraints({ (make) in
                    make.top.equalTo(lineView.snp.bottom).offset(55)
                })
            }else if(titleArray.count==2){
                content.snp.updateConstraints({ (make) in
                    make.top.equalTo(lineView.snp.bottom).offset(38+i*33)
                })
            }
            //数量
            let contentNum = UILabel()
            contentNum.text = numArray[i]
            contentNum.font = YC_FONT_PFSC_Semibold(14)
            contentNum.numberOfLines = 0
            contentNum.textColor = YCColorTitleBlack
            contentNum.tag = i+100
            bgView.addSubview(contentNum)
            contentNum.snp.makeConstraints({ (make) in
                make.top.equalTo(lineView.snp.bottom).offset(20+i*33)
                make.right.equalTo(-15)
            })
            if(titleArray.count==1){
                contentNum.snp.updateConstraints({ (make) in
                    make.top.equalTo(lineView.snp.bottom).offset(55)
                })
            }else if(titleArray.count==2){
                contentNum.snp.updateConstraints({ (make) in
                    make.top.equalTo(lineView.snp.bottom).offset(38+i*33)
                })
            }
        }
        
        //分割线
        let lastContentLable:UILabel = self.viewWithTag(10+(titleArray.count-1)) as! UILabel
        let lineView_bot = UIView()
        lineView_bot.backgroundColor = YCColorLight
        bgView.addSubview(lineView_bot)
        lineView_bot.snp.makeConstraints({ (make) in
            make.top.equalTo(lastContentLable.snp.bottom).offset(24)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.height.equalTo(1)
            make.bottom.equalTo(-50)
        })
        if(titleArray.count==1){
            lineView_bot.snp.updateConstraints({ (make) in
                make.top.equalTo(lastContentLable.snp.bottom).offset(55)
            })
        }else if(titleArray.count==2){
            lineView_bot.snp.updateConstraints({ (make) in
                make.top.equalTo(lastContentLable.snp.bottom).offset(38)
            })
        }
        //预约金额
        let surMoney = UILabel()
        surMoney.text = "预约金额："
        surMoney.font = YC_FONT_PFSC_Regular(12)
        surMoney.textColor = YCColorBlack
        bgView.addSubview(surMoney)
        surMoney.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView_bot.snp.bottom).offset(0)
            make.left.equalTo(15)
            make.height.equalTo(52)
        })
        //预约金额
        surMoneyLable.text = "￥600.98"
        surMoneyLable.font = YC_FONT_PFSC_Medium(16)
        surMoneyLable.textColor = YCColorRed
        bgView.addSubview(surMoneyLable)
        surMoneyLable.snp.makeConstraints({ (make) in
            make.left.equalTo(surMoney.snp.right).offset(0)
            make.top.equalTo(lineView_bot.snp.bottom).offset(0)
            make.height.equalTo(50)
        })
        
        //实际投资
        realMoneyLable.text = "￥600.98"
        realMoneyLable.font = YC_FONT_PFSC_Medium(16)
        realMoneyLable.textColor = YCColorRed
        bgView.addSubview(realMoneyLable)
        realMoneyLable.snp.makeConstraints({ (make) in
            make.right.equalTo(-15)
            make.top.equalTo(lineView_bot.snp.bottom).offset(0)
            make.height.equalTo(50)
        })
        
        let realTitle = UILabel()
        realTitle.text = "实际投资："
        realTitle.font = YC_FONT_PFSC_Regular(12)
        realTitle.textColor = YCColorBlack
        bgView.addSubview(realTitle)
        realTitle.snp.makeConstraints({ (make) in
            make.top.equalTo(lineView_bot.snp.bottom).offset(0)
            make.right.equalTo(realMoneyLable.snp.left).offset(0)
            make.height.equalTo(52)
        })
    }
    
    internal func gaintPersionModel(model:MyAdressModel) {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}



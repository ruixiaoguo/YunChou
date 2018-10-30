//
//  YCAccountMessageTableViewCell.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/27.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCAccountMessageTableViewCell: UITableViewCell {

    
    private lazy var timeLable : UILabel = {
        let timeLable = UILabel ()
        timeLable.font = YC_FONT_PFSC_Medium(13)
        timeLable.textColor = gof_RGBAColor(187,187,187,1)
        timeLable.textAlignment = NSTextAlignment.center
        return timeLable
    }()
    
    private lazy var backView : UIView = {
        let backView = UIView ()
        backView.backgroundColor = YCColorWhite
        backView.layer.cornerRadius = 7
        return backView
    }()
    
    private lazy var titleLable : UILabel = {
        let titleLable = UILabel ()
        titleLable.font = YC_FONT_PFSC_Medium(16)
        titleLable.textColor = YC_FontColor_DarkGray
        return titleLable
    }()
    
    private lazy var contentLable : UILabel = {
        let contentLable = UILabel ()
        contentLable.font = YC_FONT_PFSC_Medium(14)
        contentLable.textColor = YC_FontColor_45Dark
        contentLable.numberOfLines = 0
        return contentLable
    }()
    
    lazy var bo : UILabel = {
        let bo = UILabel ()
        return bo
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
        self.backgroundColor = YCBackground_LightColor
    }
    
    
    func createSubViews(){
        self.addSubview(self.timeLable)
        timeLable.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self).offset(0)
            make.height.equalTo(36)
        }
        
        self.addSubview(self.backView)
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(timeLable.snp.bottom).offset(0)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.bottom.equalTo(0)//这句一定要放在最后一个view不然无法自动计算高度
            
        }
        
        backView.addSubview(self.titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(backView).offset(16)
            make.left.equalTo(backView).offset(22)
            make.height.equalTo(25)
            make.right.equalTo(backView).offset(-22)
        }
        
       
        
        backView.addSubview(self.contentLable)
        contentLable.snp.makeConstraints { (make) in
            make.left.equalTo(backView).offset(22)
            make.top.equalTo(titleLable.snp.bottom).offset(5)
            make.right.equalTo(backView).offset(-22)
        }
        
        backView.addSubview(self.bo)
        bo.snp.makeConstraints { (make) in
            make.left.equalTo(backView).offset(0)
            make.right.equalTo(backView).offset(0)
            make.top.equalTo(contentLable.snp.bottom).offset(0)
            make.height.equalTo(0.01)
            make.bottom.equalTo(-15)//这句一定要放在最后一个view不然无法自动计算高度
        }
        
        timeLable.text = "今天 10:10"
        titleLable.text = "余额变更通知"
        contentLable.text = "您的账户充值提现成功，点击查看明细。"
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  YCSystemMessageTableViewCell.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/27.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCSystemMessageTableViewCell: UITableViewCell {

    
    
    
    lazy var timeLable : UILabel = {
        let timeLable = UILabel ()
        timeLable.font = YC_FONT_PFSC_Medium(13)
        timeLable.textColor = gof_RGBAColor(187,187,187,1)
        timeLable.textAlignment = NSTextAlignment.center
        return timeLable
    }()
    
    lazy var backView : UIView = {
       let backView = UIView ()
        backView.backgroundColor = YCColorWhite
        backView.layer.cornerRadius = 7
        return backView
    }()
    
    lazy var titleLable : UILabel = {
       let titleLable = UILabel ()
        titleLable.font = YC_FONT_PFSC_Medium(16)
        titleLable.textColor = YC_FontColor_DarkGray
        return titleLable
    }()
    
    lazy var contentLable : UILabel = {
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
        self.backgroundColor = YCBackground_LightColor
        createSubView()
        
    }
    
    var messageDate:YCMessageDateModel?{
        didSet{
            guard let model = messageDate else { return }
            
            timeLable.text = model.createTime
            titleLable.text = model.title
            let str = model.message
            contentLable.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Medium(14) , str!)
            
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubView(){
        self.contentView.addSubview(self.timeLable)
        timeLable.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(self.contentView).offset(0)
            make.height.equalTo(36)
        }
        
        self.contentView.addSubview(self.backView)
        backView.snp.makeConstraints { (make) in
            make.top.equalTo(timeLable.snp.bottom).offset(0)
            make.left.equalTo(self.contentView).offset(12)
            make.right.equalTo(self.contentView).offset(-12)
//            make.height.equalTo(98)
            make.bottom.equalTo(0)//这句一定要放在最后一个view不然无法自动计算高度

        }
        
        backView.addSubview(self.titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.top.left.equalTo(backView).offset(16)
            make.height.equalTo(24)
            make.right.equalTo(backView).offset(-10)
        }
        
        
        backView.addSubview(self.contentLable)
        contentLable.snp.makeConstraints { (make) in
            make.left.equalTo(backView).offset(16)
            make.top.equalTo(titleLable.snp.bottom).offset(4)
            make.right.equalTo(backView).offset(-15)

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
        titleLable.text = "系统升级通知"
        
        let str = "系统将于2018年11月进行升级，此段时间不能进行正常交易，请用户合理安排投资及交易时间。系统将于2018年11月进行升级，此段时间不能进行正常交易，请用户合理安排投资及交易时间。"
        contentLable.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Medium(14) , str)
        
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

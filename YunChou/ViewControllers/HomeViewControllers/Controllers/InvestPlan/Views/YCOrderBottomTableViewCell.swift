
//
//  YCOrderBottomTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/9.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCOrderBottomTableViewCell: UITableViewCell {

    
    private lazy var backvc2 : UIView = {
        let backvc2 = UIView()
        backvc2.backgroundColor = UIColor.white
        return backvc2
    }()
    
    
    private lazy var selectBtn : UIButton = {
        let selectBtn = UIButton()
        selectBtn.setImage(UIImage.init(named: "yc_order_normal"), for: .selected)
        selectBtn.setImage(UIImage.init(named: "yc_order_select"), for: .normal)
        selectBtn.addTarget(self, action: #selector(selectBtnClickHandel(sender:)), for: .touchUpInside)
        
        return selectBtn
    }()
    
    private lazy var textbc : UIView = {
        let textbc = UIView()
        textbc.backgroundColor = YCBackground_LightColor
        return textbc
    }()
    
    private lazy var sayText : UILabel = {
        let sayText = UILabel()
        sayText.textColor = YC_FontColor_102Gray
        sayText.font = YC_FONT_PFSC_Regular(13)
        sayText.numberOfLines  = 0
        return sayText
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createSubViews()
    }
    
    @objc func selectBtnClickHandel(sender : UIButton){
        sender.isSelected = !sender.isSelected
    }

    
    func createSubViews(){
        self.addSubview(self.backvc2)
        backvc2.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
           
        }
        
        
        backvc2.addSubview(self.selectBtn)
        selectBtn.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.width.height.equalTo(20)
        }
        
        backvc2.addSubview(self.textbc)
        textbc.snp.makeConstraints { (make) in
            make.left.equalTo(selectBtn.snp.right).offset(12)
            make.top.equalTo(15)
            make.right.equalTo(-12)
            
        }
        textbc.layer.cornerRadius = 6
        
        textbc.addSubview(self.sayText)
        sayText.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        
        let lin4 = UILabel()
        textbc.addSubview(lin4)
        lin4.snp.makeConstraints { (make) in
            make.top.equalTo(sayText.snp.bottom).offset(20)
            make.left.right.equalTo(0)
            make.height.equalTo(0.01)
            make.bottom.equalTo(0)
        }
        
        let lin5 = UILabel()
        backvc2.addSubview(lin5)
        lin5.snp.makeConstraints { (make) in
            make.top.equalTo(textbc.snp.bottom).offset(12)
            make.left.right.equalTo(0)
            make.height.equalTo(0.01)
            make.bottom.equalTo(0)
        }
        
        let say = "本人王子，身份证号码130746587698764556.我已认真阅读并同意《风险提示书》及其他相关条款和协议，资源预约人民币30000.00元，并支付预约金300.00元。本人已充分知晓预约金的使用说明，并同意按照预约金说明支付预约金。"
        sayText.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Regular(13), say)
        
        
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

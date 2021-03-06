
//
//  YCMessageTableViewCell.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/27.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCMessageTableViewCell: UITableViewCell {

    
    private lazy var iconImage : UIImageView = {
       let iconImage = UIImageView()
        return iconImage
    }()
    
    private lazy var redImage : UIImageView = {
        let redImage = UIImageView()
        redImage.backgroundColor = gof_RGBAColor(251 , 60 , 60 , 1)
        return redImage
    }()
    
    private lazy var titleLable : UILabel = {
        let titleLable = UILabel()
        titleLable.font = YC_FONT_PFSC_Medium(15)
        titleLable.textColor = YC_FontColor_45Dark
        return titleLable
    }()
    
    private lazy var contentLable : UILabel = {
        let contentLable = UILabel()
        contentLable.font = YC_FONT_PFSC_Regular(13)
        contentLable.textColor = YC_FontColor_LightGray
        return contentLable
    }()
    
    private lazy var timeLable : UILabel = {
        let timeLable = UILabel()
        timeLable.font = YC_FONT_PFSC_Regular(13)
        timeLable.textColor = YC_FontColor_LightGray
        timeLable.textAlignment = NSTextAlignment.right
        return timeLable
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createSubViews()
    }
    
    
    //setrr
    var titleDic:NSDictionary?{
        didSet{
            guard let dic = titleDic else {return}
            titleLable.text = (dic.object(forKey: "title") as! String)
            iconImage.image = UIImage(named: (dic.object(forKey: "icon") as! String))
        }
    }
    //setrr
    var dataDic:NSDictionary?{
        didSet{
            guard let dic = dataDic else {return}
            contentLable.text = (dic.object(forKey: "content") as! String)
            let states : String = (dic.object(forKey: "status") as! String)
            
            if states.compare("1").rawValue == 0{
                redImage.isHidden = false
            }else{
                redImage.isHidden = true
            }
            timeLable.text = (dic.object(forKey: "Time") as! String)
            
           
        }
    }
    
    
    func createSubViews(){
        self.addSubview(self.iconImage)
        iconImage.snp.makeConstraints { (make) in
            make.top.left.equalTo(self).offset(15)
            make.width.height.equalTo(42)
        }
        
        self.addSubview(self.redImage)
        redImage.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(15)
            make.left.equalTo(self).offset(91/2)
            make.width.height.equalTo(20/2)
        }
        
       
        //阴影
        redImage.layer.shadowOpacity = 0.8
        redImage.layer.shadowColor = gof_RGBAColor(251 , 60 , 60 , 0.5).cgColor
        redImage.layer.shadowOffset = CGSize(width: 1.5, height: 1.5)
        redImage.layer.cornerRadius = 20/4
        
        self.addSubview(self.titleLable)
        titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(16)
            make.left.equalTo(iconImage.snp.right).offset(14)
            make.height.equalTo(22)
            make.width.equalTo(160)
        }
        
        self.addSubview(self.contentLable)
        contentLable.snp.makeConstraints { (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(4)
            make.left.equalTo(iconImage.snp.right).offset(14)
            make.height.equalTo(20)
            make.width.equalTo(Main_Screen_Width - 80)
        }
        
        self.addSubview(self.timeLable)
        timeLable.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(19)
            make.right.equalTo(self).offset(-15)
            make.height.equalTo(20)
            make.width.equalTo(160)
        }
        
        titleLable.text = "站内信"
        contentLable.text = "您有一条系统消息"
        timeLable.text = "12:45"
        
        
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

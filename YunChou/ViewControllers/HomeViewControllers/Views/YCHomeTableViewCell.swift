//
//  YCHomeTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/9/29.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import SnapKit

class YCHomeTableViewCell: UITableViewCell {

    private lazy var backvc : UIView = {
        let backvc = UIView()
        backvc.backgroundColor = UIColor.white
        backvc.layer.cornerRadius = 6
        return backvc
    }()
    
    private lazy var herderImage : UIImageView = {
        let headerImage = UIImageView()
        headerImage.backgroundColor = UIColor.yellow
        return headerImage
    }()
    
    private lazy var nameLable : UILabel = {
        let nameLable = UILabel()
        nameLable.font = YC_FONT_PFSC_Medium(14)
        nameLable.textColor = YC_FontColor_45Dark
        
        return nameLable
    }()
    
    private lazy var yuyueBtn : UIButton = {
        let yuyueBtn = UIButton.init(type: UIButton.ButtonType.custom)
        yuyueBtn.backgroundColor = YC_Color_LightBlue
        yuyueBtn.setTitleColor(YC_Color_DarkBlue, for: .normal)
        yuyueBtn.titleLabel?.font = YC_FONT_PFSC_Medium(13)
        return yuyueBtn
    }()
    
    private lazy var contentImage : UIImageView = {
        let contentImage = UIImageView()
        contentImage.backgroundColor = UIColor.red
        return contentImage
    }()
    
    private lazy var titleLable : UILabel = {
        let titleLable = UILabel ()
        titleLable.font = YC_FONT_PFSC_Semibold(18)
        return titleLable
    }()
    
    
    private lazy var btnOne : YCButton = {
        let btnOnt = YCButton.init(type: UIButton.ButtonType.custom)
        btnOnt.setTitleColor(YC_Color_DarkBlue, for: .normal)
        btnOnt.titleLabel?.font = YC_FONT_PFSC_Medium(14)
        btnOnt.isUserInteractionEnabled = false
        //        btnOnt.addTarget(self, action: #selector(progresBtnClickHandel), for: .touchUpInside)
        btnOnt.layoutContent(style: YCButtonLayoutStyle.ImageLeftContentStart, imgSize: CGSize(width: 16, height: 16), space: 8)
        return btnOnt
    }()
    
    private lazy var btnTwo : YCButton = {
        let btnTwo = YCButton.init(type: UIButton.ButtonType.custom)
        btnTwo.setTitleColor(YC_Color_DarkBlue, for: .normal)
        btnTwo.titleLabel?.font = YC_FONT_PFSC_Medium(14)
        btnTwo.isUserInteractionEnabled = false
        //        btnOnt.addTarget(self, action: #selector(progresBtnClickHandel), for: .touchUpInside)
        btnTwo.layoutContent(style: YCButtonLayoutStyle.ImageLeftContentStart, imgSize: CGSize(width: 16, height: 16), space: 8)
        return btnTwo
    }()
    
    private lazy var contentLable :UILabel = {
        let contentLable = UILabel()
        contentLable.textColor = UIColor.lightGray
        contentLable.numberOfLines = 0;
        return contentLable
    }()
    
    private lazy var progressView : UIProgressView = {
        let progressView = UIProgressView ()
        progressView.progressViewStyle = UIProgressView.Style.default
        return progressView
    }()
    
    private lazy var stateLable : UILabel = {
        let stateLable = UILabel()
        stateLable.font = YC_FONT_PFSC_Regular(11)
        return stateLable
    }()
    
    private lazy var progressLable : UILabel = {
        let progressLable = UILabel()
        progressLable.font = YC_FONT_PFSC_Regular(11)
        return progressLable
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = YCBackground_LightColor
        createSubViews()
    }
    
    var projectData:YCHomeProjectListDataModel?{
        didSet{
            guard let model = projectData else { return }
            
            
            herderImage.sd_setImage(with:NSURL.init(string: model.icon ?? "")! as URL, placeholderImage:placeholderImg(), options: [], completed: nil)
            nameLable.text = model.companyName
            titleLable.text = model.projectName
//            let str = "复华文旅以全球创新生活思维打造360度复合度假体验球创新生活思维打造360度复合度假体验"
//            contentLable.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Regular(14) , str)
            
            let str : String = model.projectSummary!
            contentLable.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Regular(14) , str)
            
            yuyueBtn.setTitle(returnProjectStatus(status: model.projectStatus!), for: UIControl.State.normal)
            contentImage.sd_setImage(with:NSURL.init(string: model.appImageUrl ?? "")! as URL, placeholderImage:placeholderImg(), options: [], completed: nil)
            
            btnOne.setTitle(model.projectTypeName, for: .normal)
            btnOne.setImage(UIImage.init(named: "yc_home_hotel"), for: .normal)
            btnTwo.setTitle(model.district, for: .normal)
            btnTwo.setImage(UIImage.init(named: "yc_home_location"), for: .normal)
            
            progressView.progressTintColor = YC_Color_DarkBlue
            progressView.trackTintColor = YC_Color_LightBlue
            progressView.progress = Float(model.schedule!)!
            
            let strrr : String = model.remainingTime ?? ""
            
            stateLable.lineBreakMode = NSLineBreakMode.byWordWrapping
            stateLable.text = "    剩余时间：\(strrr) 小时    "
            stateLable.backgroundColor = YC_Color_LightBlue
            stateLable.textColor = YC_Color_DarkBlue
            //        stateLable.textAlignment = NSTextAlignment.center
            
            progressLable.text = "    进度：39%   "
            progressLable.backgroundColor = YC_Color_LightPink
            progressLable.textColor = YC_Color_DarkPink
            
        }
    }
    
    
    
    func createSubViews(){
        
        self.contentView.addSubview(self.backvc)
        self.backvc.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.contentView).offset(0)
            make.left.equalTo(self.contentView).offset(12)
            make.right.equalTo(self.contentView).offset(-12)
            make.bottom.equalTo(0)//这句一定要放在最后一个view不然无法自动计算高度
        }
        
        self.backvc.addSubview(self.herderImage)
        self.herderImage.snp.makeConstraints { (make) in
            make.left.equalTo(self.backvc).offset(12)
            make.width.height.equalTo(40)
            make.top.equalTo(9)
        }
        herderImage.layer.masksToBounds = true
        herderImage.layer.cornerRadius = 40/2
        
        
        self.backvc.addSubview(self.nameLable)
        nameLable.snp.makeConstraints { (make) in
            make.left.equalTo(self.herderImage.snp.right).offset(9)
            make.top.equalTo(self.backvc).offset(9)
            make.width.equalTo(180)
            make.height.equalTo(self.herderImage.snp.height)
        }
        
        self.backvc.addSubview(self.yuyueBtn)
        self.yuyueBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.backvc).offset(-12)
            make.top.equalTo(self.backvc).offset(12)
            make.width.equalTo(70)
            make.height.equalTo(30)
        }
        yuyueBtn.layer.masksToBounds = true
        yuyueBtn.layer.cornerRadius = 6
        
        self.backvc.addSubview(self.contentImage)
        self.contentImage.snp.makeConstraints { (make) in
            make.left.right.equalTo(self.backvc).offset(0)
            make.top.equalTo(self.herderImage.snp.bottom).offset(10)
            make.height.equalTo(kWidth(R: 180))
        }
        
        self.backvc.addSubview(self.titleLable)
        self.titleLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentImage.snp.bottom).offset(13)
            make.left.equalTo(self.backvc).offset(15)
            make.right.equalTo(self.backvc).offset(-15)
            
        }
        
        self.backvc.addSubview(self.btnOne)
        btnOne.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLable.snp.bottom).offset(7)
            make.left.equalTo(self.backvc).offset(15)
            make.height.equalTo(25)
            make.width.equalTo(100)
        }
        
        self.backvc.addSubview(self.btnTwo)
        btnTwo.snp.makeConstraints { (make) in
            make.top.equalTo(titleLable.snp.bottom).offset(7)
            make.left.equalTo(btnOne.snp.right).offset(5)
            make.height.equalTo(25)
            make.width.equalTo(180)
        }
        
        self.backvc.addSubview(self.contentLable)
        contentLable.snp.makeConstraints { (make) in
            make.top.equalTo(btnOne.snp.bottom).offset(9)
            make.left.equalTo(backvc).offset(15)
            make.right.equalTo(backvc).offset(-15)
        }
        
        self.backvc.addSubview(self.progressView)
        self.progressView.snp.makeConstraints { (make) in
            make.top.equalTo(self.contentLable.snp.bottom).offset(15)
            make.left.equalTo(self.backvc).offset(15)
            make.right.equalTo(self.backvc).offset(-15)
            make.height.equalTo(6)
        }
        progressView.layer.masksToBounds = true
        progressView.layer.cornerRadius = 3
        
        self.backvc.addSubview(self.stateLable)
        self.stateLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.progressView.snp.bottom).offset(12)
            make.left.equalTo(self.backvc).offset(15)
            make.height.equalTo(20)
            //            make.width.equalTo(100)
        }
        stateLable.layer.cornerRadius = 10
        stateLable.layer.masksToBounds = true
        
        self.backvc.addSubview(self.progressLable)
        self.progressLable.snp.makeConstraints { (make) in
            make.top.equalTo(self.progressView.snp.bottom).offset(12)
            make.right.equalTo(self.backvc).offset(-15)
            make.height.equalTo(20)
            //            make.width.equalTo(100)
            make.bottom.equalTo(-16)//这句一定要放在最后一个view不然无法自动计算高度
            
        }
        progressLable.layer.cornerRadius = 10
        progressLable.layer.masksToBounds = true
        
        
//        herderImage.image = UIImage(named: "btn1")
//        nameLable.text = "风兮兮"
//        titleLable.text = "复华丽江国际度假世界"
//        let str = "复华文旅以全球创新生活思维打造360度复合度假体验球创新生活思维打造360度复合度假体验"
//        contentLable.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Regular(14) , str)
//        yuyueBtn.setTitle("预约中", for: UIControl.State.normal)
//        contentImage.image = UIImage(named: "projectimage")
//
//        btnOne.setTitle("酒店", for: .normal)
//        btnOne.setImage(UIImage.init(named: "yc_home_hotel"), for: .normal)
//        btnTwo.setTitle("云南-丽江", for: .normal)
//        btnTwo.setImage(UIImage.init(named: "yc_home_location"), for: .normal)
//
//        progressView.progressTintColor = YC_Color_DarkBlue
//        progressView.trackTintColor = YC_Color_LightBlue
//        progressView.progress = 0.4
//
//        let strrr : String = "23"
//
//        stateLable.lineBreakMode = NSLineBreakMode.byWordWrapping
//        stateLable.text = "    剩余时间：\(strrr) 小时    "
//        stateLable.backgroundColor = YC_Color_LightBlue
//        stateLable.textColor = YC_Color_DarkBlue
////        stateLable.textAlignment = NSTextAlignment.center
//
//        progressLable.text = "    进度：39%   "
//        progressLable.backgroundColor = YC_Color_LightPink
//        progressLable.textColor = YC_Color_DarkPink
//        progressLable.textAlignment = NSTextAlignment.center

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

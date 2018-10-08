

//
//  YCInvestPlanTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCInvestPlanTableViewCell: UITableViewCell {

    var isShowMore = false
    
    typealias orderBtnClickBlok = () ->Void
    var orderBtnBlock:orderBtnClickBlok?
    
    typealias moreBtnClickBlok = () ->Void
    var moreBtnBlock:moreBtnClickBlok?
    
    private lazy var backvc : UIView = {
        let backvc = UIView()
        backvc.layer.cornerRadius = 6
        backvc.backgroundColor = UIColor.white
        return backvc
    }()
    
    private lazy var bcimage : UIImageView = {
        let bcimage = UIImageView()
        return bcimage
    }()
    
    private lazy var titleLB : UILabel = {
       let titleLB = UILabel()
        titleLB.textColor = UIColor.white
        titleLB.font = YC_FONT_PFSC_Semibold(16)
        return titleLB
    }()
    
    private lazy var incomeLB : UILabel = {
        let incomeLB = UILabel()
        incomeLB.textColor = YC_Color_Yellow
        incomeLB.font = YC_FONT_PFSC_Semibold(42)
        incomeLB.textAlignment = NSTextAlignment.center
        return incomeLB
    }()
    
    private lazy var tipLB : UILabel = {
        let tipLB = UILabel()
        tipLB.font = YC_FONT_PFSC_Medium(14)
        tipLB.textColor = gof_RGBAColor(201,227,255,1)
        tipLB.textAlignment = NSTextAlignment.center
        return tipLB
    }()
    
    private lazy var moneyLB : UILabel = {
        let moneyLB = UILabel()
        return moneyLB
    }()
    
    private lazy var progressView : UIProgressView = {
        let progressView = UIProgressView ()
        progressView.progressViewStyle = UIProgressView.Style.default
        return progressView
    }()
    
    private lazy var residualLB : UILabel = {
        let residualLB = UILabel()
        residualLB.textColor = YC_FontColor_DarkGray
        residualLB.font = YC_FONT_PFSC_Regular(12)
        return residualLB
    }()
    
    private lazy var orderBtn : UIButton = {
       let orderBtn = UIButton()
        orderBtn.setTitle("预约", for: .normal)
        orderBtn.setTitleColor(UIColor.white, for: .normal)
        orderBtn.backgroundColor = YC_Color_DarkGreen
        orderBtn.titleLabel?.font = YC_FONT_PFSC_Semibold(17)
        return orderBtn
    }()
    
    private lazy var contentLB : UILabel = {
       let contentLB = UILabel()
        contentLB.textColor = YC_FontColor_DarkGray
        contentLB.font = YC_FONT_PFSC_Regular(13)
        contentLB.numberOfLines = 0
        return contentLB
    }()
    
    private lazy var moreBtn : UIButton = {
       let moreBtn = UIButton()
        moreBtn.setImage(UIImage.init(named: "yc_invest_more"), for: .normal)
        return moreBtn
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = YCBackground_LightColor
        createSubViews()
    }
    
    
    var inverstPlanModel:InverPlanListModel?{
        didSet{
            guard let model = inverstPlanModel else{return}
            
            
            titleLB.text = "复华丽江国际度假世界-收益权方案-"
            incomeLB.text = "11.87%"
            tipLB.text = "预测最高投资收益率"
            
            let num = "5"
            let money = "￥30000.00"
            let stt1 = "\(money) /份 (限购\(num)份)"
            moneyLB.font = YC_FONT_PFSC_Regular(12)
            moneyLB.textColor = YC_FontColor_DarkGray
            let attributedStr : NSMutableAttributedString = NSMutableAttributedString.init(string: stt1)
            let r1 = stt1.range(of: money)
            let rang = "".nsRange(from: r1!)
            attributedStr.addAttributes([NSAttributedString.Key.font : YC_FONT_PFSC_Semibold(20),NSAttributedString.Key.foregroundColor:YC_Color_Red], range: rang)
            moneyLB.attributedText = attributedStr
            
            progressView.progressTintColor = YC_Color_DarkBlue
            progressView.trackTintColor = YC_Color_LightBlue
            progressView.progress = 0.65
            
            let re = "34"
            let stt = "剩余 \(re) 份 / 共50份"
            let attributedStr2 : NSMutableAttributedString = NSMutableAttributedString.init(string: stt)
            let r2 = stt.range(of: re)
            let rang2 = "".nsRange(from: r2!)
            attributedStr2.addAttributes([NSAttributedString.Key.foregroundColor:YC_Color_Red], range: rang2)
            residualLB.attributedText = attributedStr2
            
            let strrrr = "预测最高收益率11%+1%或者2%*\n每月进行一次分红，若任意收益分配日的收益不足"
            contentLB.attributedText = YC_FONT_RowSpacing(5 ,YC_FONT_PFSC_Regular(13) ,strrrr)
            
            bcimage.image = UIImage.init(named: "yc_invest_bcimage")
            
            orderBtn.addTarget(self, action: #selector(orderBtnClickHandel), for: .touchUpInside)
            moreBtn.addTarget(self, action: #selector(moreBtnClickHandel(sender:)), for: .touchUpInside)
            
            
            if model.isShowMore {
                let strrrr = "预测最高收益率11%+1%或者2%*\n每月进行一次分红，若任意收益分配日的收益不足\n预测最高收益率11%+1%或者2%*\n每月进行一次分红，若任意收益分配日的收益不足"
                contentLB.attributedText = YC_FONT_RowSpacing(5 ,YC_FONT_PFSC_Regular(13) ,strrrr)
            }else{
                let strrrr = "预测最高收益率11%+1%或者2%*\n每月进行一次分红，若任意收益分配日的收益不足"
                contentLB.attributedText = YC_FONT_RowSpacing(5 ,YC_FONT_PFSC_Regular(13) ,strrrr)
            }
        }
    }
    
    
    func createSubViews(){
        self.addSubview(self.backvc)
        backvc.snp.makeConstraints { (make) in
            make.top.left.equalTo(12)
            make.right.right.equalTo(-12)
            make.bottom.equalTo(0)
            
        }
        
        backvc.addSubview(self.bcimage)
        bcimage.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(131)
        }
        
        backvc.addSubview(self.titleLB)
        titleLB.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(22)
        }
//        titleLB.backgroundColor = UIColor.yellow
        
        backvc.addSubview(self.incomeLB)
        incomeLB.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(titleLB.snp.bottom).offset(5)
            make.height.equalTo(56)
        }
        
        backvc.addSubview(self.tipLB)
        tipLB.snp.makeConstraints { (make) in
            make.top.equalTo(incomeLB.snp.bottom).offset(2)
            make.left.right.equalTo(0)
            make.height.equalTo(20)
        }
        
        backvc.addSubview(self.moneyLB)
        moneyLB.snp.makeConstraints { (make) in
            make.top.equalTo(bcimage.snp.bottom).offset(15)
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.height.equalTo(30)
            
        }
        
        backvc.addSubview(self.orderBtn)
        orderBtn.snp.makeConstraints { (make) in
            make.top.equalTo(bcimage.snp.bottom).offset(18)
            make.right.equalTo(-12)
            make.height.equalTo(45)
            make.width.equalTo(112)
        }
        orderBtn.layer.cornerRadius = 45/2
        
        
        backvc.addSubview(self.progressView)
        progressView.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(moneyLB.snp.bottom).offset(10)
            make.height.equalTo(5)
            make.right.equalTo(orderBtn.snp.left).offset(-25)
        }
        progressView.layer.cornerRadius = 5/2
        progressView.layer.masksToBounds = true
        backvc.addSubview(self.residualLB)
        residualLB.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(progressView.snp.bottom).offset(10)
            make.right.equalTo(orderBtn.snp.left).offset(-25)
            make.height.equalTo(25)
        }
        
        let lin = UILabel()
        lin.backgroundColor = gof_RGBAColor(233,233,233,1)
        backvc.addSubview(lin)
        lin.snp.makeConstraints { (make) in
            make.right.left.equalTo(0)
            make.height.equalTo(1)
            make.top.equalTo(residualLB.snp.bottom).offset(15)
        }
        
        backvc.addSubview(self.contentLB)
        contentLB.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.right.equalTo(-15)
            make.top.equalTo(lin.snp.bottom).offset(10)
        }
        
        backvc.addSubview(self.moreBtn)
        moreBtn.snp.makeConstraints { (make) in
            make.height.width.equalTo(20)
            make.top.equalTo(contentLB.snp.bottom).offset(10)
            make.bottom.equalTo(-15)
            make.centerX.equalTo(backvc.snp.centerX)
        }
        
        
       
        
    }
    
    @objc func orderBtnClickHandel(){
        self.orderBtnBlock?()
    }
    
    @objc func moreBtnClickHandel(sender:UIButton){
        
        self.moreBtnBlock?()
        

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

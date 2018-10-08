//
//  YCInvestOrderTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCInvestOrderTableViewCell: UITableViewCell {

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
    
    private lazy var moneyLB : UILabel = {
        let moneyLB = UILabel()
        moneyLB.textColor = UIColor.white
        return moneyLB
    }()
    
    private lazy var progressView : UIProgressView = {
        let progressView = UIProgressView ()
        progressView.progressViewStyle = UIProgressView.Style.default
        return progressView
    }()
    
    private lazy var residualLB : UILabel = {
        let residualLB = UILabel()
        residualLB.textColor = UIColor.white
        residualLB.font = YC_FONT_PFSC_Regular(12)
        return residualLB
    }()
    
    private lazy var backvc1 : UIView = {
        let backvc1 = UIView()
        backvc1.backgroundColor = UIColor.white
        return backvc1
    }()
    private lazy var tipLB1 : UILabel = {
        let tipLB1 = UILabel()
        tipLB1.textColor = YC_FontColor_45Dark
        tipLB1.font = YC_FONT_PFSC_Medium(15)
        return tipLB1
    }()
    
    private lazy var numLB : UILabel = {
        let numLB = UILabel()
        numLB.textColor = YC_FontColor_LightGray
        numLB.font = YC_FONT_PFSC_Medium(12)
        return numLB
    }()
    
    
    
    private lazy var tipLB2 : UILabel = {
        let tipLB2 = UILabel()
        tipLB2.textColor = YC_FontColor_45Dark
        tipLB2.font = YC_FONT_PFSC_Medium(15)
        return tipLB2
    }()
    
    private lazy var momeyLB1 : UILabel = {
        let momeyLB1 = UILabel()
        momeyLB1.textColor = YC_Color_Red
        momeyLB1.textAlignment = NSTextAlignment.right
        momeyLB1.font  = YC_FONT_PFSC_Semibold(15)
        return momeyLB1
    }()
    
    
    private lazy var lin1 : UILabel = {
       let lin1 = UILabel ()
        lin1.backgroundColor = gof_RGBAColor(233,233,233,2)
        return lin1
    }()
    
    private lazy var tipLB3 : UILabel = {
        let lin1 = UILabel ()
        lin1.textColor = YC_FontColor_45Dark
        lin1.font = YC_FONT_PFSC_Semibold(16)
        return lin1
    }()
    
    private lazy var tipImage : UIImageView = {
        let lin1 = UIImageView ()
        return lin1
    }()
    
    private lazy var contentLB : UILabel = {
        let lin1 = UILabel ()
        lin1.textColor = YC_FontColor_102Gray
        lin1.numberOfLines = 0
        return lin1
    }()
    
    private lazy var lin2 : UILabel = {
        let lin1 = UILabel ()
        return lin1
    }()

    
    private lazy var backvc2 : UIView = {
        let backvc2 = UIView()
        backvc2.backgroundColor = UIColor.white
        return backvc2
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = YCBackground_LightColor
        createSubView()
        
    }
    
    
    func createSubView(){
        self.addSubview(self.bcimage)
        bcimage.snp.makeConstraints { (make) in
            make.top.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(143)
        }
        
        bcimage.addSubview(self.titleLB)
        titleLB.snp.makeConstraints { (make) in
            make.top.equalTo(24)
            make.left.equalTo(31)
            make.height.equalTo(21)
            make.right.equalTo(-5)
        }
        
        bcimage.addSubview(self.moneyLB)
        moneyLB.snp.makeConstraints { (make) in
            make.left.equalTo(31)
            make.height.equalTo(28)
            make.right.equalTo(-5)
            make.top.equalTo(titleLB.snp.bottom).offset(6)
        }
        
        bcimage.addSubview(self.progressView)
        progressView.snp.makeConstraints { (make) in
            make.left.equalTo(31)
            make.height.equalTo(5)
            make.right.equalTo(-32)
            make.top.equalTo(moneyLB.snp.bottom).offset(15)
            
        }
        progressView.layer.masksToBounds = true
        progressView.layer.cornerRadius = 5/2
        
        bcimage.addSubview(self.residualLB)
        residualLB.snp.makeConstraints { (make) in
            make.left.equalTo(31)
            make.height.equalTo(22)
            make.right.equalTo(-5)
            make.top.equalTo(progressView.snp.bottom).offset(9)
        }
        

        self.addSubview(self.backvc1)
        backvc1.snp.makeConstraints { (make) in
            make.top.equalTo(bcimage.snp.bottom).offset(0)
            make.left.right.equalTo(0)
//            make.height.equalTo(216)
        }
        backvc1.addSubview(self.tipLB1)
        tipLB1.snp.makeConstraints { (make) in
            make.top.equalTo(17)
            make.left.equalTo(15)
            make.height.equalTo(21)
            make.width.equalTo(60)
        }
        
        backvc1.addSubview(self.numLB)
        numLB.snp.makeConstraints { (make) in
            make.left.equalTo(tipLB1.snp.right).offset(20)
            make.top.equalTo(17)
            make.width.equalTo(120)
            make.height.equalTo(21)
        }
        
        backvc1.addSubview(self.tipLB2)
        tipLB2.snp.makeConstraints { (make) in
            make.top.equalTo(tipLB1.snp.bottom).offset(30)
            make.left.equalTo(15)
            make.height.equalTo(21)
            make.width.equalTo(60)
        }
        
        backvc1.addSubview(self.momeyLB1)
        momeyLB1.snp.makeConstraints { (make) in
            make.top.equalTo(tipLB1.snp.bottom).offset(30)
            make.right.equalTo(-15)
            make.height.equalTo(21)
            make.width.equalTo(200)
        }
        
        backvc1.addSubview(self.lin1)
        lin1.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(tipLB2.snp.bottom).offset(15)
            make.height.equalTo(0.6)
        }
        
        backvc1.addSubview(self.tipLB3)
        tipLB3.snp.makeConstraints { (make) in
            make.left.equalTo(15)
            make.top.equalTo(lin1.snp.bottom).offset(15)
            make.width.equalTo(90)
            make.height.equalTo(21)
        }
        
        backvc1.addSubview(self.tipImage)
        tipImage.snp.makeConstraints { (make) in
            make.left.equalTo(tipLB3.snp.right).offset(0)
            make.top.equalTo(lin1.snp.bottom).offset(17)
            make.width.height.equalTo(17)
        }
        
        backvc1.addSubview(self.contentLB)
        contentLB.snp.makeConstraints { (make) in
            make.top.equalTo(tipLB3.snp.bottom).offset(11)
            make.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        backvc1.addSubview(self.lin2)
        lin2.snp.makeConstraints { (make) in
            make.top.equalTo(contentLB.snp.bottom).offset(5)
            make.right.left.equalTo(0)
            make.height.equalTo(0.01)
            make.bottom.equalTo(-20)
        }
        
        
        
        self.addSubview(self.backvc2)
        backvc2.snp.makeConstraints { (make) in
            make.top.equalTo(backvc1.snp.bottom).offset(10)
            make.left.right.equalTo(0)
            make.height.equalTo(173)
            make.bottom.equalTo(0)
        }
        
        
        bcimage.image = UIImage.init(named: "yc_invest_bcimage")

        titleLB.text = "复华丽江国际度假世界-收益权方案-"
        
        let num = "5"
        let money = "￥30000.00"
        let stt1 = "\(money) /份 (限购\(num)份)"
        moneyLB.font = YC_FONT_PFSC_Regular(12)
        let attributedStr : NSMutableAttributedString = NSMutableAttributedString.init(string: stt1)
        let r1 = stt1.range(of: money)
        let rang = "".nsRange(from: r1!)
        attributedStr.addAttributes([NSAttributedString.Key.font : YC_FONT_PFSC_Semibold(20)], range: rang)
        moneyLB.attributedText = attributedStr
        
        progressView.progressTintColor = gof_RGBAColor(250,200,81,1)
        progressView.trackTintColor = YC_Color_DDarkBlue
        progressView.progress = 0.3
        
        let re = "34"
        let stt = "剩余 \(re) 份 / 共50份"
        let attributedStr2 : NSMutableAttributedString = NSMutableAttributedString.init(string: stt)
        let r2 = stt.range(of: re)
        let rang2 = "".nsRange(from: r2!)
        attributedStr2.addAttributes([NSAttributedString.Key.foregroundColor:gof_RGBAColor(250,200,81,1)], range: rang2)
        residualLB.attributedText = attributedStr2
        
        tipLB1.text = "选择份数"
        numLB.text = "您还可以添加4份"
        
        tipLB2.text = "订单金额"
        momeyLB1.text = "￥30000.00"
        
        tipLB3.text = "预约金说明"
        tipImage.image = UIImage.init(named: "yc_invest_tipImage")
        let cont = "预约斤为投资金额1%，认购时自动抵扣，若您最终放弃认购，预约金将转为代金券，不可退现。预约斤为投资金额1%，认购时自动抵扣，若您最终放弃认购，预约金将转为代金券，不可退现。"
        contentLB.attributedText = YC_FONT_RowSpacing(5 , YC_FONT_PFSC_Medium(14), cont)
      
        
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

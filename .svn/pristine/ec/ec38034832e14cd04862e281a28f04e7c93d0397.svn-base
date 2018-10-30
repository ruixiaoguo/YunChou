
//
//  YCNewsTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCNewsTableViewCell: UITableViewCell {

    private lazy var imgView : UIImageView = {
       let img = UIImageView()
        return img
    }()
    
    private lazy var titleLB : UILabel = {
        let lb = UILabel()
        lb.font = YC_FONT_PFSC_Medium(15)
        lb.textColor = YC_FontColor_45Dark
        return lb
    }()
    
    private lazy var contentLB : UILabel = {
        let lb = UILabel()
        lb.font = YC_FONT_PFSC_Regular(14)
        lb.textColor = gof_RGBAColor(153,153,153,1)
        return lb
    }()
    
    private lazy var timeLB : UILabel = {
        let lb = UILabel()
        lb.font = YC_FONT_PFSC_Regular(13)
        lb.textColor = gof_RGBAColor(208,208,208,1)
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }

    var newsModel:YCNewsDataModel?{
        didSet{
            guard let model = newsModel else { return }
            
            imgView.sd_setImage(with: URL.init(string: model.imgmob ?? "1"), placeholderImage: placeholderImg(), options: [], context: nil)
            titleLB.text = model.title
            contentLB.numberOfLines = 2
            let str : String = model.summary ?? ""
            contentLB.attributedText = YC_FONT_RowSpacing(5,YC_FONT_PFSC_Regular(14),str)
            timeLB.text = model.publishDate

        }
    }
    
    
   func createSubViews(){
    self.addSubview(self.imgView)
    imgView.snp.makeConstraints { (make) in
        make.top.equalTo(i5Rate(R: 23))
        make.left.equalTo(15)
        make.width.equalTo(i5Rate(R: 136))
        make.height.equalTo(i5Rate(R: 105))
    }
    self.addSubview(self.titleLB)
    titleLB.snp.makeConstraints { (make) in
        make.top.equalTo(i5Rate(R: 26))
        make.left.equalTo(imgView.snp.right).offset(15)
        make.right.equalTo(-10)
        make.height.equalTo(i5Rate(R: 22))
    }
    
    self.addSubview(self.contentLB)
    contentLB.snp.makeConstraints { (make) in
        make.top.equalTo(titleLB.snp.bottom).offset(i5Rate(R: 10))
        make.left.equalTo(imgView.snp.right).offset(15)
        make.right.equalTo(-10)
        make.height.equalTo(i5Rate(R: 45))
    }
    self.addSubview(self.timeLB)
    timeLB.snp.makeConstraints { (make) in
        make.top.equalTo(contentLB.snp.bottom).offset(i5Rate(R: 10))
        make.left.equalTo(imgView.snp.right).offset(15)
        make.right.equalTo(-10)
        make.height.equalTo(i5Rate(R: 18))
    }
    
    let lin = UILabel()
    lin.backgroundColor = gof_RGBAColor(238,238,238,1)
    self.addSubview(lin)
    lin.snp.makeConstraints { (make) in
        make.bottom.equalTo(0)
        make.left.equalTo(15)
        make.right.equalTo(0)
        make.height.equalTo(1)
    }
    
    imgView.image = UIImage(named: "projectimage")
    titleLB.text = "“我们的时代”2018企业年会"
    contentLB.numberOfLines = 2
    let str = "2018年1月21日，以“我们的时代”为主题的复华集团2018企业年会在北..."
    contentLB.attributedText = YC_FONT_RowSpacing(5,YC_FONT_PFSC_Regular(14),str)
    timeLB.text = "2018.01.22"
    
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

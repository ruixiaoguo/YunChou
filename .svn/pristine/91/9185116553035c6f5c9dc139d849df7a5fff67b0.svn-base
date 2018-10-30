

//
//  YCInfoOpenTableViewCell.swift
//  YunChou
//
//  Created by yy on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCInfoOpenTableViewCell: UITableViewCell {
    private lazy var iconImage : UIImageView = {
        let img = UIImageView()
        return img
    }()
    private lazy var titleLB : UILabel = {
        let lb = UILabel()
        lb.textColor = YC_FontColor_45Dark
        lb.font = YC_FONT_PFSC_Medium(15)
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createSubViews()
    }
    
   func createSubViews(){
    self.addSubview(self.iconImage)
    iconImage.snp.makeConstraints { (make) in
        make.top.equalTo(15)
        make.left.equalTo(20)
        make.width.height.equalTo(30)
    }
    self.addSubview(self.titleLB)
    titleLB.snp.makeConstraints { (make) in
        make.top.bottom.equalTo(0)
        make.left.equalTo(iconImage.snp.right).offset(15)
        make.right.equalTo(-60)
    }
    
    
    let lin = UILabel()
    lin.backgroundColor = gof_RGBAColor(240,240,240,1)
    self.addSubview(lin)
    lin.snp.makeConstraints { (make) in
        make.left.equalTo(15)
        make.height.equalTo(0.7)
        make.right.equalTo(0)
        make.bottom.equalTo(-0.7)
    }
    
    iconImage.image = UIImage(named: "yc_order_wx")
    titleLB.text = "项目可行性报告.pdf"
    
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

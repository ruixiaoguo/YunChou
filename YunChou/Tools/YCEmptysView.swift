//
//  YCEmptyView.swift
//  YunChou
//
//  Created by yy on 2018/10/19.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCEmptysView: UIView {

    let imageName : String  =  "yc_emptyView"

    
    //提醒图片
    fileprivate lazy var tempImageView: UIImageView = {
        let promptImageView = UIImageView()
        promptImageView.contentMode = .scaleAspectFit
        return promptImageView
    }()
    
    //标题
    fileprivate lazy var titleLabel: UILabel = {
        let titleL = UILabel()
        titleL.textAlignment = .center
        titleL.font = YC_FONT_PFSC_Medium(16)
        titleL.textColor = YCBackground_LightColor
        titleL.text = "暂无数据"
        return titleL
    }()
    //详情
    fileprivate lazy var detailLabel: UILabel = {
        let detailL = UILabel()
        detailL.textAlignment = .center
        detailL.numberOfLines = 2
        return detailL
    }()
    //
    fileprivate  lazy var actionButton: UIButton = {
        let btn = UIButton()
        btn.layer.masksToBounds = true
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubViews()
    }
    
    
    
   func createSubViews(){
    self.addSubview(tempImageView)
    let images = UIImage(named: imageName)
    tempImageView.image = images
    tempImageView.snp.makeConstraints { (make) in
        make.centerX.equalTo(self)
        make.centerX.equalTo(self).offset(-40)
        make.height.equalTo(252)
        make.width.equalTo(252)
    }
    self.addSubview(titleLabel)
    titleLabel.snp.makeConstraints { (make) in
        make.top.equalTo(tempImageView.snp.bottom).offset(10)
        make.right.left.equalTo(0)
        make.height.equalTo(40)
    }
    
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

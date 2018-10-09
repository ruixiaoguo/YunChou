//
//  YCSearchSegmentBtnView.swift
//  swiftRNTest
//
//  Created by yy on 2018/9/28.
//  Copyright © 2018年 yy. All rights reserved.
//

import UIKit

class YCSearchSegmentBtnView: UIView {

    
    private lazy var timeBtn : YCButton = {
      let timeBtn = YCButton()
        timeBtn.setTitle("发布时间", for: .normal)
        timeBtn.setImage(UIImage.init(named: "yc_sengUP"), for: .normal)
        timeBtn.setTitleColor(YC_FontColor_LightGray, for: .normal)
        timeBtn.titleLabel?.font = YC_FONT_PFSC_Regular(14)
        timeBtn.addTarget(self, action: #selector(timeBtnClickHandel), for: .touchUpInside)
        timeBtn.layoutContent(style: YCButtonLayoutStyle.ImageRightContentStart, imgSize: CGSize(width: 16, height: 16), space: 1)

        
        return timeBtn
    }()
    
    private lazy var progresBtn : YCButton = {
        let progresBtn = YCButton.init(type: UIButton.ButtonType.custom)
        
        progresBtn.setTitle("进度", for: .normal)
        progresBtn.setImage(UIImage.init(named: "yc_sengUP"), for: .normal)
        progresBtn.setTitleColor(YC_FontColor_LightGray, for: .normal)
        progresBtn.titleLabel?.font = YC_FONT_PFSC_Regular(14)
        progresBtn.addTarget(self, action: #selector(progresBtnClickHandel), for: .touchUpInside)
        progresBtn.layoutContent(style: YCButtonLayoutStyle.ImageRightContentStart, imgSize: CGSize(width: 16, height: 16), space: 1)

        return progresBtn
    }()
    
    private lazy var stateBtn : YCButton = {
        let stateBtn = YCButton.init(type: UIButton.ButtonType.custom)
        stateBtn.setTitle("项目状态", for: .normal)
        stateBtn.setImage(UIImage.init(named: "yc_sengUP"), for: .normal)
        stateBtn.setTitleColor(YC_FontColor_LightGray, for: .normal)
        stateBtn.titleLabel?.font = YC_FONT_PFSC_Regular(14)
        stateBtn.addTarget(self, action: #selector(stateBtnClickHandel), for: .touchUpInside)
        stateBtn.layoutContent(style: YCButtonLayoutStyle.ImageRightContentStart, imgSize: CGSize(width: 16, height: 16), space: 1)

        return stateBtn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCBackground_LightColor
        createSubViews()
    }
    
    func createSubViews(){
        self.addSubview(self.timeBtn)
        timeBtn.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.top.bottom.equalTo(0)
            make.width.equalTo(90)
        }
        

        self.addSubview(self.progresBtn)
        progresBtn.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(0)
            make.width.equalTo(60)
            make.centerX.equalTo(self.snp.centerX)
        }
        
        
        self.addSubview(self.stateBtn)
        stateBtn.snp.makeConstraints { (make) in
            make.right.equalTo(-30)
            make.top.bottom.equalTo(0)
            make.width.equalTo(90)
        }
        
    }
    
    @objc func timeBtnClickHandel(){
        
        UIView.animate(withDuration: 0.3) {
            self.timeBtn.imageView?.transform = (self.timeBtn.imageView?.transform.rotated(by: .pi))!
        }
        
        
    }
    
    @objc func progresBtnClickHandel(){
        UIView.animate(withDuration: 0.3) {
            self.progresBtn.imageView?.transform = (self.progresBtn.imageView?.transform.rotated(by: .pi))!
        }
    }
    
    @objc func stateBtnClickHandel(){
        UIView.animate(withDuration: 0.3) {
            self.stateBtn.imageView?.transform = (self.stateBtn.imageView?.transform.rotated(by: .pi))!
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

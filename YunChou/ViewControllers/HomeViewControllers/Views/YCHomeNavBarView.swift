//
//  YCHomeNavBarView.swift
//  YunChou
//
//  Created by yy on 2018/9/29.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCHomeNavBarView: UIView {
    let statusBarH = UIApplication.shared.statusBarFrame.size.height
    
    
    typealias searchBtnClickBlok = () ->Void
    var searchBlock:searchBtnClickBlok?
    
    typealias messageBtnClickBlok = () ->Void
    var messageBlock:messageBtnClickBlok?
    
    
    private lazy var oneBtn : UIButton={
        let oneBtn = UIButton(type: UIButton.ButtonType.custom)
        oneBtn.frame = CGRect(x: self.frame.size.width - 90, y: statusBarH + 10, width: 22, height: 22)
        oneBtn.setImage(UIImage.init(named: "搜索"), for: .normal)
        oneBtn.addTarget(self, action: #selector(searchBtnClick), for: .touchUpInside)
        return oneBtn
        
    }()
    
    private lazy var twoBtn : UIButton={
        let twoBtn = UIButton(type: UIButton.ButtonType.custom)
        twoBtn.frame = CGRect(x: self.frame.size.width - 38, y: statusBarH + 10, width: 22, height: 22)
        twoBtn.setImage(UIImage.init(named: "消息"), for: .normal)
        twoBtn.addTarget(self, action: #selector(messageBtnClick), for: .touchUpInside)
        return twoBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubView(){
        self.addSubview(oneBtn)
        self.addSubview(twoBtn)
    }
    
    
    @objc func searchBtnClick()  {
        self.searchBlock?()
    }
    
    @objc func messageBtnClick()  {
        self.messageBlock?()
    }


}

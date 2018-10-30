//
//  MyAdressFootView.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyFootButtonView: UIView {
    
    let sureOverBtn = UIButton()
    var sureOvercallBlock:(()->Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi() {
        sureOverBtn.setTitle("新增收货地址", for: .normal)
        sureOverBtn.setTitleColor(YCColorWhite, for: .normal)
        sureOverBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        sureOverBtn.layer.cornerRadius = 20
        self.addSubview(sureOverBtn)
        self.sureOverBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.right.equalTo(-25)
            make.left.equalTo(25)
            make.height.equalTo(40)
        }
        self.sureOverBtn.addTarget(self, action:#selector(sureOverBtnClick(_:)), for:.touchUpInside)
        self.sureOverBtn.setColors(superView: self.sureOverBtn)
    }
    
    //MARK:========新增地址
    @objc func sureOverBtnClick(_ button:UIButton){
        sureOvercallBlock!()
    }
}

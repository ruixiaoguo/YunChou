//
//  MyAdressFootView.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyAdressFootView: UIView {
    
    let addAdressBtn = UIButton()
    var addAdresscallBlock:(()->Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = YCColorWhite
        self.initUi()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initUi() {
        addAdressBtn.setTitle("新增收货地址", for: .normal)
        addAdressBtn.setTitleColor(YCColorWhite, for: .normal)
        addAdressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        addAdressBtn.layer.cornerRadius = 20
        self.addSubview(addAdressBtn)
        self.addAdressBtn.snp.makeConstraints { (make) in
            make.bottom.equalTo(-10)
            make.right.equalTo(-25)
            make.left.equalTo(25)
            make.height.equalTo(40)
        }
        self.addAdressBtn.addTarget(self, action:#selector(addAdressClick(_:)), for:.touchUpInside)
        self.addAdressBtn.setColors(superView: self.addAdressBtn)
    }
    
    //MARK:========新增地址
    @objc func addAdressClick(_ button:UIButton){
        addAdresscallBlock!()
    }
}

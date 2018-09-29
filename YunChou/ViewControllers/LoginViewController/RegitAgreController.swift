//
//  RegitAgreController.swift
//  YunChou
//
//  Created by grx on 2018/9/29.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class RegitAgreController: BaseHtmlController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = YCColorWhite
        self.leftView.isHidden = false
        self.startLoadWithTitle(title: "注册协议", url: "http://www.sina.com")
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}

//
//  ForgetPassController.swift
//  YunChou
//
//  Created by grx on 2018/9/28.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class ForgetPassController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "忘记密码"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
    }
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}

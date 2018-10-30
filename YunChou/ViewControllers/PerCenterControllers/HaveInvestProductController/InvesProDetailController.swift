//
//  InvesProDetailController.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class InvesProDetailController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "已投项目详情"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
    }
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}

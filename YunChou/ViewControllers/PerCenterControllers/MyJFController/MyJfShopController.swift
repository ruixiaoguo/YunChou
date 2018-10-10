//
//  MyJfShopController.swift
//  YunChou
//
//  Created by grx on 2018/10/10.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class MyJfShopController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "积分商城"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}

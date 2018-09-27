//
//  SelectAdressController.swift
//  YunChou
//
//  Created by grx on 2018/9/27.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class SelectAdressController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "选择地区"
        self.view.backgroundColor = YCColorLight
        self.leftView.isHidden = false
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }
}

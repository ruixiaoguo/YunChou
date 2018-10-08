//
//  CumerInterController.swift
//  YunChou
//
//  Created by grx on 2018/10/8.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class CumerInterController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "消费权益"
        self.view.backgroundColor = YCColorWhite
        self.leftView.isHidden = false
    }
    
    override func backToPrevious() {
        self.navigationController!.popViewController(animated: true)
    }

}

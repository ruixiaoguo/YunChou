//
//  UITextField+Extension.swift
//  YunChou
//
//  Created by grx on 2018/9/30.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
    /// 给uitextfield添加一个清除按钮
    func setModifyClearButton() {
        let clearButton = UIButton(type: .custom)
        clearButton.setImage(UIImage(named: "textFiledClear"), for: .normal)
        clearButton.frame = CGRect(x: 0, y: 0, width: 18, height: 18)
        clearButton.contentMode = .scaleAspectFit
        clearButton.addTarget(self, action: #selector(UITextField.clear(sender:)), for: .touchUpInside)
        self.rightView = clearButton
        self.rightViewMode = .whileEditing
    }
    
    /// 点击清除按钮，清空内容
    @objc func clear(sender : AnyObject) {
        self.text = ""
    }
}

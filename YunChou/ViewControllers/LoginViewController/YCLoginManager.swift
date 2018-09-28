//
//  YCLoginManager.swift
//  YunChou
//  跳转到登录界面
//  Created by grx on 2018/9/28.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class YCLoginManager: NSObject {
    
    class func PushToLoginController(ower:UIViewController){
        let loginVC = LoginViewController()
        let nav:BaseNavigationController = BaseNavigationController(rootViewController:loginVC as UIViewController)
        nav.view.backgroundColor = YCColorWhite
        ower.present(nav, animated: true, completion: nil)
    }
}

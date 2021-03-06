//
//  AppDelegate.swift
//  YunChou
//
//  Created by grx on 2018/9/20.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?
    let rootVC = TabBarController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame:UIScreen.main.bounds)
        rootVC.delegate = self
        self.window?.rootViewController = rootVC
        self.window!.makeKeyAndVisible()
        IQKeyboardManager.shared.enable = true
        
        self.configUSharePlatforms()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
                
        if viewController.tabBarItem.tag==2 && !ISLOGIN() {
            let loginVC = LoginViewController()
            let nav:BaseNavigationController = BaseNavigationController(rootViewController:loginVC as UIViewController)
            loginVC.isFromSelMe = true
            nav.view.backgroundColor = YCColorWhite
            tabBarController.selectedViewController!.present(nav, animated: true, completion: nil)
            loginVC.loginSuccessBlock = {[weak self]() in
                self!.rootVC.selectedIndex = 2
            }
            return false
        }
        return true
    }
    
    //MARK:================ 设置U盟微信平台
    func configUSharePlatforms()  {
        UMConfigure.initWithAppkey("5b568f1fb27b0a1e7a000066", channel: nil)
        UMSocialManager.default()?.setPlaform(UMSocialPlatformType.wechatSession, appKey: "wxdd73798a6a6aa43f", appSecret: "e03b6fb636781edf49cd0448f6dd2461", redirectURL: "http://mobile.umeng.com/social")
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        //6.3的新的API调用，是为了兼容国外平台(例如:新版facebookSDK,VK等)的调用[如果用6.2的api调用会没有回调],对国内平台没有影响
        let result = UMSocialManager.default()?.handleOpen(url, options: options)
        if (!result!) {
            // 其他如支付等SDK的回调
        }
        return result!
    }
    

}


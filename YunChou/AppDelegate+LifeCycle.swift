//
//  AppDelegate+LifeCycle.swift
//  YunChou
//
//  Created by grx on 2018/10/15.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications
extension AppDelegate {
    
    public func registerAppNotificationSetting(lauchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        if #available(iOS 10.0, *) {
            let notifiCenter = UNUserNotificationCenter.current()
            notifiCenter.delegate = (self as! UNUserNotificationCenterDelegate)
            let types = UNAuthorizationOptions(arrayLiteral: [.alert, .badge, .sound])
            notifiCenter.requestAuthorization(options: types, completionHandler: { (flag, error) in
                if flag {
                    print("IOS request notification success");
                } else {
                    print("IOS request notification fail");
                }
            })
        } else {
            let setting = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil);
            UIApplication.shared.registerUserNotificationSettings(setting);
        }
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("deviceToken\(deviceToken)");
        //错误写法
        //获取deviceToken打印为32bytes
        let token = deviceToken.description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        print("token:\(token)")
        
        //正确写法
        let device = NSData(data: deviceToken)
        let deviceId = device.description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        print("token:\(deviceId)")
    }
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        print("userInfo:\(userInfo)")
        completionHandler([.sound, .alert])
    }
    
    //处理后台点击通知的代理方法
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        print("userInfo:\(userInfo)")
        completionHandler()
    }
    
    //iOS8和iOS9只需要执行以下方法就好了
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("收到新消息Active\(userInfo)")
        if application.applicationState == .active {
            
        } else {
            UIApplication.shared.applicationIconBadgeNumber = 0
        }
        completionHandler(.newData)
    }
}

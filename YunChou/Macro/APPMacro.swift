//
//  APPMacro.swift
//  ShopProject-Swift
//
//  Created by grx on 2018/9/4.
//  Copyright © 2018年 grx. All rights reserved.
//

import Foundation
import UIKit

let mainWindow: UIWindow = ((UIApplication.shared.delegate?.window)!)!

let Main_Screen_Width = UIScreen.main.bounds.width
let Main_Screen_Height = UIScreen.main.bounds.height

/*代替之前的49*/
let kTabBarHeight: CGFloat = (UIApplication.shared.statusBarFrame.size.height > 20.0 ? 83.0:49.0)
/** 判断是否iphoneX系列 */
let iPhoneXS = (mainWindow.safeAreaInsets.bottom > 0.0) ? true:false

let NaviBarHeight:CGFloat = (iPhoneXS ? 88 : 64)
let StatusBarHeight:CGFloat = (iPhoneXS ? 44 : 20)
let SafeBottomMargin:CGFloat = (iPhoneXS ? 34 : 0)

/*全屏幕高度*/
let Screen_Height = Main_Screen_Height+NaviBarHeight+SafeBottomMargin

/*! 屏幕比适配宽高 */
func kWidth(R:CGFloat)->CGFloat{
    let nowR = R*(Main_Screen_Width)/375
    return nowR
}

// MARK: ---- 生成颜色
/// 根据RGBA生成颜色(格式为：22,22,22,0.5)
var gof_RGBAColor: (CGFloat, CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue, alpha in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: alpha);
}
/// 根据RGB生成颜色(格式为：22,22,22)
var gof_RGBColor: (CGFloat, CGFloat, CGFloat) -> UIColor = {red, green, blue in
    return UIColor(red: red / 255, green: green / 255, blue: blue / 255, alpha: 1);
}
/// 根据色值生成颜色(无透明度)(格式为0xffffff)
var gof_ColorWithHex: (NSInteger) -> UIColor = {hex in
    return UIColor(red: ((CGFloat)((hex & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((hex & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(hex & 0xFF)) / 255.0, alpha: 1);
}

// MARK: ---- 三大色调
let YCColorWhite = gof_ColorWithHex(0xFFFFFF);     // 主色调，白色
let YCColorBlack = gof_ColorWithHex(0x000000);   // 主色调，黑色
let YCColorLight = gof_ColorWithHex(0xF2F4F6);   //全局灰色
let YCColorDarkLight = gof_ColorWithHex(0xADADAD);   //全局深灰色
let YCColorBlue = gof_ColorWithHex(0x309FFF);   //全局浅蓝色
let YCColorLoginLine = gof_ColorWithHex(0xDCE1ED);   //登录分割线

//字体
var YC_FONT_PFSC_Semibold: (CGFloat) -> UIFont = {size in
    return UIFont(name: "PingFangSC-Semibold", size: size) ?? UIFont.systemFont(ofSize: size)
}
var YC_FONT_PFSC_Medium: (CGFloat) -> UIFont = {size in
    return UIFont(name: "PingFangSC-Medium", size: size) ?? UIFont.systemFont(ofSize: size)
}
var YC_FONT_PFSC_Regular: (CGFloat) -> UIFont = {size in
    return UIFont(name: "PingFangSC-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
}
var YC_FONT_PFSC_Light: (CGFloat) -> UIFont = {size in
    return UIFont(name: "PingFangSC-Light", size: size) ?? UIFont.systemFont(ofSize: size)
}
//富文本设置行间距
var YC_FONT_RowSpacing :(CGFloat , UIFont , String) -> NSAttributedString = { size, font, str in
    //通过富文本来设置行间距
    let paraph = NSMutableParagraphStyle()
    //将行间距设置为28
    paraph.lineSpacing = size
    //样式属性集合
    let attributes = [NSAttributedString.Key.font:font,
                      NSAttributedString.Key.paragraphStyle: paraph]
    return NSAttributedString(string: str, attributes: attributes)
}

// MARK: ---- 打印日志
/**
 打印日志
 - parameter message: 日志消息内容
 */
func printLog<T>(message: T)
{
    #if DEBUG
    print(" \(message)");
    #endif
}

// 客服电话
let YCKeFUPhone = "4007658376"



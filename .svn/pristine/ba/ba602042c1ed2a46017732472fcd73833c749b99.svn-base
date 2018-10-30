//
//  UIView+Extension.swift
//  BSBDJ
//
//  Created by apple on 2017/11/6.
//  Copyright © 2017年 incich. All rights reserved.
//

import UIKit



// MARK: - 增加是否在当前显示的窗口
extension UIView {

    public func isShowingnKeyWindow() -> Bool {

        guard let keyWindow = UIApplication.shared.keyWindow else {
            return false
        }

        //以主窗口的左上角为原点, 计算self的矩形框(谁调用这个方法这个self就是谁)
        let frame = keyWindow.convert(self.frame, from: self.superview)


        //判断主窗口的bounds和self的范围是否有重叠
        let isIntersects = frame.intersects(keyWindow.bounds)
        return isIntersects && !self.isHidden && self.alpha > 0 && self.window == keyWindow
    }
}


// MARK: - 获得View的上下左右中心点(x, y)
extension UIView {

    //x
    var zc_x: CGFloat {
        get {
            return frame.origin.x
        }
        set{
            var tempFrame: CGRect = frame
            tempFrame.origin.x = newValue
            frame = tempFrame
        }
    }

    // y

    var zc_y: CGFloat {
        set {
            var tempFrame: CGRect = frame
            tempFrame.origin.y = newValue
            frame = tempFrame
        }
        get {
            return frame.origin.y

        }

    }

    // height
    var zc_height : CGFloat {
        get {
            return frame.size.height
        }

        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }

    // width
    var zc_width : CGFloat {
        get {
            return frame.size.width
        }

        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }

    // left
    var zc_left : CGFloat {
        get {
            return zc_x
        }

        set(newVal) {
            zc_x = newVal
        }
    }

    // right
    var zc_right : CGFloat {
        get {
            return zc_x + zc_width
        }

        set(newVal) {
            zc_x = newVal - zc_width
        }
    }

    // bottom
    var zc_bottom : CGFloat {
        get {
            return zc_y + zc_height
        }

        set(newVal) {
            zc_y = newVal - zc_height
        }
    }


//自身中心点
    var zc_center: CGPoint {

        get {
            return CGPoint(x: bounds.width / 2.0, y: bounds.height / 2.0)
        }
        set {
            center = CGPoint(x: newValue.x, y: newValue.y)
        }

    }






    //中心点x
    var zc_centerX : CGFloat {
        get {
            return center.x
        }

        set(newVal) {
            center = CGPoint(x: newVal, y: center.y)
        }
    }
    //中心点y
    var zc_centerY : CGFloat {
        get {
            return center.y
        }
        
        set(newVal) {
            center = CGPoint(x: center.x, y: newVal)
        }
    }
}

extension UIView {
    //MARK:======设置渐变色
     func setColors(superView:UIView) {
        //定义渐变的颜色
        let gradientColors = [gof_ColorWithHex(0x237AFF).cgColor,
                              gof_ColorWithHex(0x2A90FF).cgColor,
                              gof_ColorWithHex(0x309FFF).cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0,0.4,0.8,1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        //设置渲染的起始结束位置（横向渐变）
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = CGRect(x: 0, y: 0, width: Main_Screen_Width-30, height: 130)
        superView.layer.insertSublayer(gradientLayer, at: 0)
        superView.layer.masksToBounds = true;
    }
    
    //MARK:======设置渐变色
    func setSomeColors(superView:UIView , gradientColors:NSArray) {
        //定义渐变的颜色
//        let gradientColors = [gof_ColorWithHex(0x237AFF).cgColor,
//                              gof_ColorWithHex(0x2A90FF).cgColor,
//                              gof_ColorWithHex(0x309FFF).cgColor]
        
        //定义每种颜色所在的位置
        let gradientLocations:[NSNumber] = [0.0,0.4,0.8,1.0]
        
        //创建CAGradientLayer对象并设置参数
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = (gradientColors as! [Any])
        gradientLayer.locations = gradientLocations
        
        //设置渲染的起始结束位置（横向渐变）
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        
        //设置其CAGradientLayer对象的frame，并插入view的layer
        gradientLayer.frame = CGRect(x: 0, y: 0, width: Main_Screen_Width-30, height: 130)
        superView.layer.insertSublayer(gradientLayer, at: 0)
        superView.layer.masksToBounds = true;
    }
}

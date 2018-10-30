
//
//  YCHandelConfing.swift
//  YunChou
//
//  Created by yy on 2018/10/23.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit
import Foundation

class YCHandelConfing: NSObject {

}
//获取当前时间
func NOWDATE(formatStr : String) -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = formatStr
    formatter.locale = Locale.current
    let strNowTime = formatter.string(from: date)
    return strNowTime
}

//获取展位图图片名
func placeholderImg() -> UIImage{
    let image : UIImage = UIImage(named: "yc_emptyView")!
    return image
}

//返回项目状态
func returnProjectStatus(status : String) -> String{
    if status == "99" {
        return "申请中"
    }else if status == "98"{
        return "待审核"
    }else if status == "0"{
        return "完善中"
    }else if status == "1"{
        return "审核通过"
    }else if status == "2"{
        return "审核驳回"
    }else if status == "3"{
        return "预约中"
    }else if status == "93"{
        return "预约认购中"
    }else if status == "4"{
        return "公开认购中"
    }else if status == "5"{
        return "冷静期"
    }else if status == "6"{
        return "分红中"
    }else if status == "7"{
        return "项目完成"
    }else if status == "8"{
        return "认购失败"
    }else if status == "9"{
        return "延期"
    }else if status == "11"{
       return "撤销"
    }else if status == "12"{
        return "项目认购成功"
    }else{
        return ""
    }
    
}

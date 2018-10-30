//
//  UtilityFunction.swift
//  YunChou
//
//  Created by grx on 2018/9/26.
//  Copyright © 2018年 grx. All rights reserved.
//

import UIKit

class UtilityFunction: NSObject {
    //MARK:======验证邮箱
    class func validateEmail(email: String) -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        let isValid = predicate.evaluate(with: email)
        return isValid
    }
    //MARK:======验证手机号码
    class func validatePhonoNum(photo: String) -> Bool {
        let phoneString = "^0?(13|15|16|17|18|14)[0-9]{9}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", phoneString)
        let isValid = predicate.evaluate(with: photo)
        return isValid
    }
    //MARK:======验证身份证号码
    class func validateIdNumber(idCart: String) -> Bool {
        let str = idCart.trimmingCharacters(in: .whitespaces)
        if (str.count != 18) {
            return false;
        }
        let idCartString = "^(\\d{14}|\\d{17})(\\d|[xX])$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", idCartString)
        let isValid = predicate.evaluate(with: idCart)
        return isValid
    }
}

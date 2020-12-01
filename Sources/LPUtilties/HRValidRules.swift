//
//  HRValidRules.swift
//  HeartRetail
//
//  Created by lipeng on 2020/8/17.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation

/// MARK : - 校验仅为 字母、数字
func checkOnlyNumerAndAscii(string:String) -> Bool {
    let regx = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    let characterSet = NSCharacterSet(charactersIn: regx).inverted
    let filtered = string.components(separatedBy: characterSet).joined(separator: "")
    return string.elementsEqual(filtered)
}

/// MARK : - 校验邮箱格式
 func validateEmail(email: String) -> Bool {
    let emailString = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailString)
    return emailPredicate.evaluate(with: email)
}


//
//  String+Limit.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/13.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation

extension String {
   
    // MARK:-截取字符串从开始到 index
    
    func substring(to index: Int) -> String {
        guard let end_Index = validEndIndex(original: index) else {
            return self;
        }

        return String(self[startIndex..<end_Index]);
    }
    
    // MARK:-截取字符串从index到结束
    
    func substring(from index: Int) -> String {
        guard let start_index = validStartIndex(original: index)  else {
            return self
        }
        return String(self[start_index..<endIndex])
    }
    
    // MARK:-切割字符串(区间范围 前闭后开)
    
    func sliceString(_ range:CountableRange<Int>)->String{

        guard
            let startIndex = validStartIndex(original: range.lowerBound),
            let endIndex   = validEndIndex(original: range.upperBound),
            startIndex <= endIndex
            else {
                return ""
        }

        return String(self[startIndex..<endIndex])
    }
    
    // MARK:-切割字符串(区间范围 前闭后闭)
    
    func sliceString(_ range:CountableClosedRange<Int>)->String{

        guard
            let start_Index = validStartIndex(original: range.lowerBound),
            let end_Index   = validEndIndex(original: range.upperBound),
            startIndex <= endIndex
            else {
                return ""
        }
        if(endIndex.utf16Offset(in: self) <= end_Index.utf16Offset(in: self)){
            return String(self[start_Index..<endIndex])
        }
        return String(self[start_Index...end_Index])

    }
    
    // MARK:-校验字符串位置 是否合理，并返回String.Index
    
    private func validIndex(original: Int) -> String.Index {

        switch original {
        case ...startIndex.utf16Offset(in: self) : return startIndex
        case endIndex.utf16Offset(in: self)...   : return endIndex
        default                          : return index(startIndex, offsetBy: original)
        }
    }
    
    // MARK:-校验是否是合法的起始位置
    
    private func validStartIndex(original: Int) -> String.Index? {
        guard original <= endIndex.utf16Offset(in: self) else { return nil }
        return validIndex(original:original)
    }
    // MARK:-校验是否是合法的结束位置
    
    private func validEndIndex(original: Int) -> String.Index? {
        guard original >= startIndex.utf16Offset(in: self) else { return nil }
        return validIndex(original:original)
    }
    
    func toRange(_ range: NSRange) -> Range<String.Index>? {
        guard let from16 = utf16.index(utf16.startIndex, offsetBy: range.location, limitedBy: utf16.endIndex) else { return nil }
        guard let to16 = utf16.index(from16, offsetBy: range.length, limitedBy: utf16.endIndex) else { return nil }
        guard let from = String.Index(from16, within: self) else { return nil }
        guard let to = String.Index(to16, within: self) else { return nil }
        return from ..< to
    }
    
    // MARK : - 中英文混合长度
    
  func getStringLenthOfBytes() -> Int {
        var length = 0
        for i in 0..<self.count {
            //截取字符串中的每一个字符
            let s = sliceString(CountableRange(NSRange(location: i, length: 1))!)
            if validateChineseChar(s) {
                print(" s 打印信息:\(s)")
                length += 2
            } else {
                length += 1
            }
            print(String(format: " 打印信息:%@  %ld", s, length))
        }
        return length
    }
    
    // MARK : - 指定位置截取字符串
    
    func subBytesOfstring(to index: Int) -> String? {
        var length = 0
        var chineseNum = 0
        var zifuNum = 0
        for i in 0..<self.count {
            // 截取字符串中的每一个字符
            let s = sliceString(CountableRange(NSRange(location: i, length: 1))!)
            if validateChineseChar(s) {
                if length + 2 > index {
                    return substring(to: chineseNum + zifuNum)
                }
                length += 2
                chineseNum += 1
            } else {
                if length + 1 > index {
                    return substring(to: chineseNum + zifuNum)
                }
                length += 1
                zifuNum += 1
            }
        }
        return substring(to: index)
    }
    
    // 检测中文或者中文符号
    
   func validateChineseChar(_ string: String?) -> Bool {
       let nameRegEx = "[\\u{0391}-\\u{FFE5}]"
       if string?.isMatchesRegularExp(nameRegEx) == nil {
           return false
       }
       return true
   }

   // 检测中文
   func validateChinese(_ string: String?) -> Bool {
       let nameRegEx = "[\u{4e00}-\u{9fa5}]"
       if string?.isMatchesRegularExp(nameRegEx) == nil {
           return false
       }
       return true
   }

    func isMatchesRegularExp(_ regex: String?) -> Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex ?? "")
        return predicate.evaluate(with: self)
    }

    @discardableResult
    mutating func stringTrim() -> String {
        self = trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        return self
    }
}


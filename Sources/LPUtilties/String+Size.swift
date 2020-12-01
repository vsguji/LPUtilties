//
//  String+Size.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/20.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation

extension String {
    
    static private func getNormalStrSize(str: String? = nil, attriStr: NSMutableAttributedString? = nil, font: CGFloat, w: CGFloat, h: CGFloat) -> CGSize {
         if str != nil {
             let strSize = (str! as NSString).boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: font)], context: nil).size
             return strSize
         }
         
         if attriStr != nil {
             let strSize = attriStr!.boundingRect(with: CGSize(width: w, height: h), options: .usesLineFragmentOrigin, context: nil).size
             return strSize
         }
         
         return CGSize.zero
        
     }

     /// MARK : - 获取获取字符串尺寸高度
     
    static func getNormalStrH(str: String, strFont: CGFloat, w: CGFloat) -> CGFloat {
         return getNormalStrSize(str: str, font: strFont, w: w, h: CGFloat.greatestFiniteMagnitude).height
     }

     /// MARK : - 获取字符串宽度
     
    static func getNormalStrW(str: String, strFont: CGFloat, h: CGFloat) -> CGFloat {
         return getNormalStrSize(str: str, font: strFont, w: CGFloat.greatestFiniteMagnitude, h: h).width
     }
}

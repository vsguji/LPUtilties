//
//  HRLabel.swift
//  HeartRetail
//
//  Created by lipeng on 2020/6/11.
//  Copyright © 2020 dengyun. All rights reserved.
//
import Foundation
import UIKit

enum VerticalAlignmentType : Int {
    case top = 0
    case middle
    case bottom
}


/// MARK : - 设置UILabel 顶部、中间、底部对齐方式

class HRMsgLabel: UILabel {
    
    var verticalAlignment: VerticalAlignmentType?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        verticalAlignment = .middle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  func setVerticalAlignment(_ verticalType: VerticalAlignmentType) {
       verticalAlignment = verticalType
       setNeedsDisplay()
   }

 override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
    var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
       switch verticalAlignment {
       case .top:
               textRect.origin.y = bounds.origin.y
       case .bottom:
               textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height + 2 // 2 调优值
       case .middle:
               fallthrough
           default:
               textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0
       }
       return textRect
   }

  override func drawText(in requestedRect: CGRect) {
       let actualRect = textRect(forBounds: requestedRect, limitedToNumberOfLines: numberOfLines)
       super.drawText(in: actualRect)
   }
}

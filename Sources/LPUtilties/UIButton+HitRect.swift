//
//  HRButtonHitRect.swift
//  HeartRetail
//
//  Created by lipeng on 2020/3/23.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func setHitEdgeInsets( edge: UIEdgeInsets) {
        let key:UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "UIEdgeInsets".hash)!
        let value = NSValue(uiEdgeInsets: edge)
        objc_setAssociatedObject(self, key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func getHitEdgeInsets() ->UIEdgeInsets {
        let key:UnsafeRawPointer! = UnsafeRawPointer.init(bitPattern: "UIEdgeInsets".hash)!
        let value = objc_getAssociatedObject(self, key) as? NSValue
        var edgeInsets = UIEdgeInsets.zero
        value?.getValue(&edgeInsets)
        return value != nil ? edgeInsets : .zero
    }
    
    
    override open func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if getHitEdgeInsets() == UIEdgeInsets.zero || !isEnabled || isHidden || alpha == 0 {
            return super.point(inside: point, with: event)
        } else {
            let relativeFrame = bounds
            let hitFrame = relativeFrame.inset(by: getHitEdgeInsets())
            return hitFrame.contains(point)
        }
    }
}

//
//  HRMCompatible.swift
//  Alamofire
//
//  Created by lipeng on 2020/3/28.
//

import Foundation

/**
 设置模板协议
 */
public final class HRMessageCenter<Base> {
    public let base:Base
    public init(_ base:Base){
        self.base = base
    }
}

public protocol HRMessageCenterCompatible {
    associatedtype CompatType
    var mc:CompatType {get}
}

public extension HRMessageCenterCompatible {
    var mc:HRMessageCenter<Self> {
        return HRMessageCenter(self)
    }
}

extension UIView:HRMessageCenterCompatible {}

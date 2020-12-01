//
//  HRLayerShape.swift
//  Alamofire
//
//  Created by lipeng on 2020/3/28.
//

import Foundation
import UIKit
import SwiftyColor

/**
  UIView 添加 阴影协议
 */
extension HRMessageCenter where Base:UIView {
    
    func addLayerShape(rect:CGRect) {
        let gradientLayer = CAGradientLayer()
          gradientLayer.frame = rect
          gradientLayer.colors = [0xDEDEDE.color.cgColor,0xE2E2E2.color.cgColor]
          gradientLayer.locations = [0.0, 0.8]
          gradientLayer.shadowColor = 0xE1E1E1.color.cgColor
          gradientLayer.shadowRadius = 2
          gradientLayer.shadowOpacity = 0.6
          gradientLayer.shadowOffset = CGSize(width: 0, height: 2)
          base.layer.addSublayer(gradientLayer)
    }
    
    func drawLayerShape() {
        base.layer.shadowColor = 0xE1E1E1.color.cgColor
        base.layer.shadowRadius = 2
        base.layer.shadowOpacity = 0.6
        base.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}

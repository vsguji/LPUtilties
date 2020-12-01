//
//  HRImage.swift
//  HRMessageCenter_Example
//
//  Created by lipeng on 2020/3/17.
//  Copyright © 2020 lipeng. All rights reserved.
//

import Foundation
import UIKit

extension Bundle {
    
    static func loadImage (_ cls:AnyClass,_ imageName:String) -> UIImage {
         guard let bundlePath = Bundle(for: cls).path(forResource: "HRMessageCenter", ofType: "bundle") else {
           return UIImage()
          }
          if #available(iOS 13, *) {
           return UIImage(named: imageName, in: Bundle(path: bundlePath), compatibleWith: UITraitCollection.current) ?? UIImage()
          } else {
           return UIImage(named: imageName, in: Bundle(path: bundlePath), compatibleWith: nil) ?? UIImage()
       }
    }
}

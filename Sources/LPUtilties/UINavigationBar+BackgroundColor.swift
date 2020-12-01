//
//  UINavigation+BackgroundColor.swift
//  HeartRetail
//
//  Created by lipeng on 2020/3/24.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation
import UIKit

/**
  设置导航风格
 */
extension UINavigationBar {
    
    func setNavigationBarStyle() {
        
        let navBar = UINavigationBar.appearance()
        navBar.shadowImage = UIImage()
        navBar.barTintColor = .white
        navBar.titleTextAttributes = [.font : UIFont.boldSystemFont(ofSize: 16)]
        navBar.isTranslucent = false
    }

}

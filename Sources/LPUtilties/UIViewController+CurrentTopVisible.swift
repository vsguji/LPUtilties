//
//  UIViewController+CurrentTopVisible.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/22.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation

extension UIViewController {
    
     /// MARK : - 当前顶层控制器
     func currentViewController() -> UIViewController? {
        var window = UIApplication.shared.keyWindow
        if window?.windowLevel != .normal {
            let windows = UIApplication.shared.windows
            for tmpWin in windows {
                if tmpWin.windowLevel == .normal {
                    window = tmpWin
                    break
                }
            }
        }
        var currentVC = window?.rootViewController
        while ((currentVC?.presentedViewController) != nil) {
            currentVC = currentVC?.presentedViewController
        }
        if (currentVC is UITabBarController) {
            currentVC = (currentVC as? UITabBarController)?.selectedViewController
        }
        if (currentVC is UINavigationController) {
            currentVC = (currentVC as? UINavigationController)?.topViewController
        }
        return currentVC
    }
}

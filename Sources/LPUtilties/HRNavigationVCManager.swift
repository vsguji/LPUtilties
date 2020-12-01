//
//  HRNavigationVCManager.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/15.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation
import UIKit

struct HRNavigationVCManager {
    
    /// MARK : - 回退级别
    
    static func navigationVCBackStep(step:Int,currentNavigationVC:UINavigationController) {
        var vcs = currentNavigationVC.viewControllers
        for _ in 0..<step {
            vcs.removeLast()
        }
        currentNavigationVC.viewControllers = vcs
    }
    
    /// MARK : -  回退到指定控制器
    
    static func navigationToTargetVC(targetVC:UIViewController,currentNavigationVC:UINavigationController) {
        currentNavigationVC.popToViewController(targetVC, animated: true)
    }
    
    /// MARK : -  应用顶层控制器
       
       static func topViewController() -> UIViewController? {
           var  topViewController = UIApplication.shared.delegate?.window??.rootViewController
           while true {
               if topViewController?.presentingViewController != nil{
                   topViewController = topViewController?.presentingViewController
               }else if (topViewController is UINavigationController && (topViewController as? UINavigationController)?.topViewController != nil) {
                   topViewController = (topViewController as? UINavigationController)?.topViewController
               }else if (topViewController is UITabBarController) {
                   let bottomTab = (topViewController as? UITabBarController)
                   topViewController = bottomTab?.selectedViewController
               }
               else {
                   break
               }
           }
           return topViewController
       }
    
}

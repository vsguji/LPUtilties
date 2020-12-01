//
//  HRTimer.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/16.
//  Copyright © 2020 dengyun. All rights reserved.
//

import UIKit

/**
  定时器
 */
class HRTimer: NSObject {
    
    deinit {
          print("==n 计时器已销毁 == ")
      }
    
    private(set) var _timer: Timer!
    
    fileprivate weak var _aTarget: AnyObject!
    
    fileprivate var _aSelector: Selector!
    
    class func scheduledTimer(timeInterval ti: TimeInterval,
                              target aTarget: AnyObject,
                              selector aSelector: Selector,
                              userInfo: Any?,
                              repeats yesOrNo: Bool) -> HRTimer {
        let timer = HRTimer()

        timer._aTarget = aTarget
        timer._aSelector = aSelector
        timer._timer = Timer.scheduledTimer(timeInterval: ti,
                                            target: timer,
                                            selector: #selector(HRTimer.timerRun),
                                            userInfo: userInfo,
                                            repeats: yesOrNo)
        return timer
    }
    
    func fire() {
        _timer.fire()
    }
    
    func invalidate() {
        _timer.invalidate()
    }
    
    
    @objc func timerRun() {
        _ = _aTarget.perform(_aSelector)
    }
    
    var fireDate: Date {
           get{
               return _timer.fireDate
           }
           set{
               _timer.fireDate = newValue
           }
       }
       
}

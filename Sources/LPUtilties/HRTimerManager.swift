//
//  HRTimerManager.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/16.
//  Copyright © 2020 dengyun. All rights reserved.
//
import UIKit

/**
  倒计时定时器管理
 */
class HRTimerManager {
    
    deinit {
          stopTimer.invalidate()
    }
    
    // 倒数读秒
    var secondsToEnd: UInt = 0
    // 倒计时
    var stopTimer: HRTimer!
    // 倒计时结束回调
    var callBack: ((String)->())?
    // 倒计时结束
    var endBack:(()->Void)?
    
    @discardableResult
    init(seconds: UInt, callBack: ((String)->())?,endBack:(()->Void)?) {
        self.callBack = callBack
        self.endBack = endBack
        self.secondsToEnd = seconds
        stopTimer = HRTimer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        RunLoop.current.add(stopTimer._timer, forMode: RunLoop.Mode.common)
        stopTimer.fire()
    }
    
    /// MARK - 倒计时
    
    @objc func timerRun() {
        secondsToEnd -= 1
        if secondsToEnd == 0 {
            stopTimer.invalidate()
            endBack?()
        }
        let willEndTimeString = secondsToTimeString(seconds: secondsToEnd)
        callBack?(willEndTimeString)
    }
    
    /// 秒数转化为时间字符串
    
    func secondsToTimeString(seconds: UInt) -> String {
        return Date.secondsToTime(timeStamp: UInt(seconds))
    }
}

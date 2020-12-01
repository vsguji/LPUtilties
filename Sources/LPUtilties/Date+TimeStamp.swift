//
//  Date+TimeStemp.swift
//  HeartRetail
//
//  Created by lipeng on 2020/4/9.
//  Copyright © 2020 dengyun. All rights reserved.
//

import Foundation

extension Date {
    
    // MARK : - 秒转字符串 09天01小时23分34秒
    
    static func secondsToDayAndTime(timeStamp:UInt) -> String {
          let days = UInt(timeStamp/(3600*24))
          let hours = UInt((timeStamp - days*24*3600)/3600)
          let minute = UInt((timeStamp - days*24*3600-hours*3600)/60)
          let second = UInt((timeStamp - days*24*3600-hours*3600) - 60*minute)
          let timeString = String(format: "%2d天%2d小时%2d分%2d秒", days,hours,minute,second)
          return timeString
    }
    
    
    // MARK : - 秒转字符串 01小时23分34秒
       
       static func secondsToTime(timeStamp:UInt) -> String {
             let hours = UInt((timeStamp)/3600)
             let minute = UInt((timeStamp - hours*3600)/60)
             let second = UInt((timeStamp - hours*3600) - 60*minute)
             let timeString = String(format: "%2d小时%2d分%2d秒",hours,minute,second)
             return timeString
       }
    
    // MARK : - String 转  Date
      static func date(_ dateString: String?, format: String?) -> Date? {
           let dateFormatter = DateFormatter()
           dateFormatter.locale = NSLocale.current
           dateFormatter.timeZone = NSTimeZone.local
           dateFormatter.dateFormat = format
           let destDate = dateFormatter.date(from: dateString ?? "")
           return destDate
     }
}

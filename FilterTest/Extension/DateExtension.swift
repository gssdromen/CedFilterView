//
//  DateExtension.swift
//  JingJiRen_ESF_iOS
//
//  Created by gssdromen on 21/10/2016.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import Foundation

extension Date {
    func toChatTimeString() -> String {
        let today = Date()
        let yesterday = Date(timeIntervalSinceNow: -3600 * 24)
        let tomorrow = Date(timeIntervalSinceNow: 3600 * 24)

        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "MM-dd"

        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"

        if dayFormatter.string(from: self) == dayFormatter.string(from: today) {
            // 今天
            return "今天 \(timeFormatter.string(from: self))"
        } else if dayFormatter.string(from: self) == dayFormatter.string(from: yesterday) {
            // 昨天
            return "昨天 \(timeFormatter.string(from: self))"
        } else if dayFormatter.string(from: self) == dayFormatter.string(from: tomorrow) {
            // 明天
            return "明天 \(timeFormatter.string(from: self))"
        } else {
            return dayFormatter.string(from: self) + " " + timeFormatter.string(from: self)
        }
    }

    func toReleaseTimeString() -> String {
        let today = Date()
        let tomorrow = Date(timeIntervalSinceNow: 3600 * 24)

        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "MM-dd"

        if dayFormatter.string(from: self) == dayFormatter.string(from: today) {
            // 今天
            return "今天"
        } else if dayFormatter.string(from: self) == dayFormatter.string(from: tomorrow) {
            // 明天
            return "明天"
        } else {
            let dayNum = Int(floor((self.timeIntervalSince1970 - today.timeIntervalSince1970) / TimeInterval(3600 * 24)))
            return "\(dayNum)天后"
        }
    }

    func toZeroOfDay() -> Date {
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.chinese)!

        return calendar.date(bySettingHour: 0, minute: 0, second: 0, of: self, options: NSCalendar.Options.matchFirst)!
    }

}

// MARK: - timeInterval转变为时间字符串
extension TimeInterval {
    func getTimeString(formatter: String = "MM月dd日 HH:mm") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter
        let date: Date = Date(timeIntervalSince1970: self/1000)
        return dateFormatter.string(from: date)

    }

    func getReleaseTime(formate: String = "yyyy/MM/dd HH:mm") -> String {

        let date: Date = Date()
        let space = date.timeIntervalSince1970 - self/1000

        if space < 60 {
            return "刚刚"
        }

        if space < 60*60 {
            return Int(space/(60)).toString() + "分钟前"
        }

        if space < 60*60*12 {
            return Int(space/3600).toString() + "小时前"
        }

        if space < 60*60*24 {
            return "今天" + self.getTimeString(formatter: "HH:mm")
        }

        return self.getTimeString(formatter: formate)
    }

}

//
//  DoubleExtension.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 3/3/16.
//  Copyright © 2016 FangDuoDuo. All rights reserved.
//

import Foundation

extension Double {
    func toAreaFormat() -> String {
        let dou = NSString(format: "%.2f", self)
        let array = dou.components(separatedBy: ".")
        if array.count == 2 {
            if array[1] == "00" {
                return array[0]
            } else if array[1].hasSuffix("0") {
                return dou.substring(to: dou.length - 1)
            } else {
                return dou as String
            }
        } else {
            return ""
        }
    }

    func toPriceFormat() -> String {
        let dou = NSString(format: "%.2f", self)
        let array = dou.components(separatedBy: ".")
        if array.count == 2 {
            if array[1] == "00" {
                return array[0]
            } else if array[1].hasSuffix("0") {
                return dou.substring(to: dou.length - 1)
            } else {
                return dou as String
            }
        } else {
            return ""
        }
    }

    func toCountDownSecondFromat() -> String {
        let dou = NSString(format: "%.1f", self)
        return dou as String
    }
}

//
//  IntExtension.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 2/25/16.
//  Copyright © 2016 FangDuoDuo. All rights reserved.
//

import Foundation

extension Int {

    func toString() -> String {
        return String(self)
    }

    func size() -> Int {
        return self.toString().characters.count
    }

    func toHDesign() -> CGFloat {
        if Constant.View.kScreenWidth == 375 {
            return CGFloat(self)
        } else {
            return CGFloat(Int(Constant.View.kScreenWidth * CGFloat(self) / 375))
        }
    }

    func toVDesign() -> CGFloat {
        if Constant.View.kScreenHeight == 667 {
            return CGFloat(self)
        } else {
            return CGFloat(Int(Constant.View.kScreenHeight * CGFloat(self) / 667))
        }
    }

    func toFontDesign() -> CGFloat {
        if Constant.View.kScreenHeight == 667 {
            return CGFloat(self)
        } else {
            return CGFloat(Int(Constant.View.kScreenHeight * CGFloat(self) / 667))
        }
    }
}

extension Int32 {
    func toInt() -> Int {
        return Int(self)
    }

    func toString() -> String {
        return String(self)
    }
}

extension Int64 {

    func toInt() -> Int {
        return Int(self)
    }

    func toString() -> String {
        return String(self)
    }
}

extension UInt {
    func toInt() -> Int {
        return Int(self)
    }

    func toString() -> String {
        return String(self)
    }
}

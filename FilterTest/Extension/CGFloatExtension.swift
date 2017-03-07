//
//  CGFloatExtension.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 16/5/27.
//  Copyright © 2016年 FangDuoDuo. All rights reserved.
//

import Foundation

extension CGFloat {
    func toHDesign() -> CGFloat {
        if Constant.View.kScreenWidth == 375 {
            return self
        } else {
            return CGFloat(Int(Constant.View.kScreenWidth * self / 375))
        }
    }

    func toVDesign() -> CGFloat {
        if Constant.View.kScreenHeight == 667 {
            return self
        } else {
            return CGFloat(Int(Constant.View.kScreenHeight * self / 667))
        }
    }

    func toFontDesign() -> CGFloat {
        if Constant.View.kScreenHeight == 667 {
            return self
        } else {
            return CGFloat(Int(Constant.View.kScreenHeight * self / 667))
        }
    }
}

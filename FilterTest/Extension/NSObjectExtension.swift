//
//  NSObjectExtension.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 2/4/16.
//  Copyright © 2016 FangDuoDuo. All rights reserved.
//

import Foundation

extension NSObject {
    var theClassName: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

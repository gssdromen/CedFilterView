//
//  TableDrivenConvenientFunction.swift
//  HouseKeeper_swift
//
//  Created by 张灿 on 16/11/10.
//  Copyright © 2016年 FDD. All rights reserved.
//  表驱动法参数转描述的便捷方法

import Foundation

extension Array {
    public subscript(index: Int, defaultValue: Element) -> Element {
        if index >= 0 && index < self.count {
            return self[index]
        } else {
            return defaultValue
        }
    }
}

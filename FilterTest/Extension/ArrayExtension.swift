//
//  ArrayExtension.swift
//  FilterTest
//
//  Created by cedricwu on 3/10/17.
//  Copyright © 2017 Cedric Wu. All rights reserved.
//

import Foundation

extension Array {
    mutating func removeElementAtIndexes(indexes: [Int]) {
        var temp = [Element]()
        for i in 0 ..< count {
            if indexes.contains(i) {

            } else {
                temp.append(self[i])
            }
        }
        self = temp
    }
}

//
//  CedFilterOperation.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 16/3/21.
//  Copyright © 2016年 Cedric Wu. All rights reserved.
//

import Foundation

// 是否有一个chain是另一个的子集，用来判断是否需要高亮
func ~=(left: CedFilterChain, right: CedFilterChain) -> Bool {
    weak var pLeftNode = left.startNode
    weak var pRightNode = right.startNode
    if pLeftNode == nil && pRightNode == nil {
        return true
    } else if pLeftNode != nil && pRightNode == nil {
        return false
    } else if pLeftNode == nil && pRightNode != nil {
        return false
    }

    var flag = true

    while pLeftNode != nil && pRightNode != nil {
        if pLeftNode! != pRightNode! {
            flag = false
            break
        }
        if pLeftNode!.next != nil && pRightNode!.next != nil {
            pLeftNode = pLeftNode!.next
            pRightNode = pRightNode!.next
        } else {
            flag = true
            break
        }

    }

    return flag

//    let leftCopy = left.copy()
//    let rightCopy = right.copy()
//    var leftNode: CedFilterNode! = leftCopy.startNode
//    var rightNode: CedFilterNode! = rightCopy.startNode
//    if leftNode == nil && rightNode == nil {
//        return true
//    }
//
//    var flag = true
//
//    while leftNode != nil && rightNode != nil {
//        if leftNode != rightNode {
//            flag = false
//            break
//        }
//        if leftNode.next != nil && rightNode.next != nil {
//            leftNode = leftNode.next
//            rightNode = rightNode.next
//        } else {
//            flag = true
//            break
//        }
//    }
//    return flag
}

// 判断两个chain是否完全相等
func ==(left: CedFilterChain, right: CedFilterChain) -> Bool {
    weak var pLeftNode: CedFilterNode? = left.startNode
    weak var pRightNode: CedFilterNode? = right.startNode
    if pLeftNode == nil && pRightNode == nil {
        return true
    }

    var flag = true

    while pLeftNode != nil && pRightNode != nil {
        if pLeftNode! != pRightNode! {
            flag = false
            break
        } else {
            pLeftNode = pLeftNode?.next
            pRightNode = pRightNode?.next
            if pLeftNode == nil && pRightNode == nil {
                break
            } else if pLeftNode != nil && pRightNode != nil {
                continue
            } else {
                flag = false
                break
            }
        }
    }

    return flag
}

func ==(left: CedFilterNode, right: CedFilterNode) -> Bool {
    var flag = false
    if left.section == right.section && left.column == right.column && left.row == right.row {
        flag = true
    }
    return flag
}

func !=(left: CedFilterNode, right: CedFilterNode) -> Bool {
    var flag = false
    if left.section != right.section || left.column != right.column || left.row != right.row {
        flag = true
    }
    return flag
}

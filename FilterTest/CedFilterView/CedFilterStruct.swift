//
//  CedFilterStruct.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 3/19/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import Foundation

class CedFilterNode: CustomStringConvertible, NSCopying {
    var section: Int = -1
    var column: Int = -1
    var row: Int = -1
    var title: String = ""
    var selected: Bool = false

    var prev: CedFilterNode?
    var next: CedFilterNode?

    init(section: Int, column: Int, row: Int, title: String, selected: Bool) {
        self.section = section
        self.column = column
        self.row = row

        self.prev = nil
        self.next = nil
        self.title = title
        self.selected = selected
    }

    func copy(with zone: NSZone? = nil) -> Any {
        let newInstance = CedFilterNode(section: self.section, column: self.column, row: self.row, title: self.title, selected: self.selected)

        return newInstance as CedFilterNode
    }

    func getLastNode() -> CedFilterNode {
        weak var temp: CedFilterNode? = self
        while temp!.next != nil {
            temp! = temp!.next!
        }
        return temp!
    }

    func getFirstNode() -> CedFilterNode {
        weak var temp: CedFilterNode? = self
        while temp!.prev != nil {
            temp! = temp!.prev!
        }
        return temp!
    }

    func connect(_ aNode: CedFilterNode) {
        self.next = aNode
        aNode.prev = self
    }

    var description: String {
        return "**** (\(self.section), \(self.column), \(self.row))"
    }
}

struct CedFilterSection {
    var section: Int = -1
    var title: String = ""

    init(section: Int, title: String = "") {
        self.section = section
        self.title = title
    }
}

struct CedFilterChain: CustomStringConvertible {
    var startNode: CedFilterNode

    init(node: CedFilterNode) {
        self.startNode = node
    }

    func copy() -> CedFilterChain {
        weak var pNode: CedFilterNode? = startNode

        let newStartNode = CedFilterNode(section: startNode.section, column: startNode.column, row: startNode.row, title: startNode.title, selected: startNode.selected)
        weak var pNewNode: CedFilterNode? = newStartNode
        let newInstance = CedFilterChain(node: newStartNode)

        while pNode?.next != nil {
            if let n = pNode?.next?.copy() as? CedFilterNode {
                n.prev = pNewNode
                pNewNode?.next = n

                pNode = pNode?.next
            }
        }
        return newInstance
    }

    func popLastNode() -> CedFilterNode {
        weak var pNode: CedFilterNode? = startNode
        if length() > 1 {
            while pNode?.next != nil {
                pNode = pNode?.next
            }
            pNode?.prev?.next = nil
            pNode?.prev = nil
            pNode?.next = nil
            return pNode!
        } else {
            return pNode!
        }
    }

    func replaceLastNode(node: CedFilterNode) {
        let n = self.startNode.getLastNode()

        n.section = node.section
        n.column = node.column
        n.row = node.row
    }

    func length() -> Int {
        var len = 1

        var n = startNode
        while n.next != nil {
            n = n.next!
            len += 1
        }
        return len
    }

    var description: String {
        weak var pNode: CedFilterNode? = startNode
        var str = pNode!.description

        while pNode!.next != nil {
            pNode = pNode?.next
            str += " -> " + pNode!.description
        }
        return str
    }

    var debugDescription: String {
        weak var pNode: CedFilterNode? = startNode
        var str = pNode!.description

        while pNode!.next != nil {
            pNode = pNode?.next
            str += " -> " + pNode!.description
        }
        return str
    }
}

struct CedFilterSectionSelection {
    var section: Int = -1
    var chains: [CedFilterChain] = [CedFilterChain]()

    mutating func reset() {
        self.section = -1
        self.chains = [CedFilterChain]()
    }

    init() {

    }

    var description: String {
        var str = ""
//        for c in self.chains {
//            str += c.description + "\n"
//        }
        return str
    }

    var debugDescription: String {
        var str = ""
//        for c in self.chains {
//            str += c.description + "\n"
//        }
        return str
    }

    init(section: Int, chains: [CedFilterChain]) {
        self.section = section
        self.chains = chains
    }

    init(section: Int, group: [CedFilterNode]) {
        self.section = section
        for i in 0 ..< group.count {
            let node = group[i]
            if i == 0 {
                self.chains.removeAll()
                let chain = CedFilterChain(node: node)
                self.chains.append(chain)
            } else {
                let chain = self.chains.last!
                chain.startNode.getLastNode().connect(node)
            }
        }
    }
}

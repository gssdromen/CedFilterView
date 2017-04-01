//
//  ESFFilterModel.swift
//  JingJiRen_ESF_iOS
//
//  Created by cedricwu on 12/29/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import ObjectMapper

extension ESFFilterItemModel {
    class func getDepth(model: ESFFilterItemModel) -> Int {
        var max = 0
        guard model.subItems != nil else {
            return max + 1
        }
        for item in model.subItems! {
            let height = ESFFilterItemModel.getDepth(model: item)
            if height > max {
                max = height
            }
        }
        return max + 1
    }
}

extension ESFFilterItemModel {
    func getDepth() -> Int {
        var depth = 0
        if subItems == nil {
            return depth
        }
        for item in subItems! {
            let height = item.getDepth()
            depth = max(height, depth)
        }

        return depth + 1
    }
}

class ESFFilterItemModel: NSObject, Mappable {
//    var maxDepth = -1

    var depth: Int?
    var maxDepth: Int?
    var displayText: String?
    var filterKey: String?
    var fullFilterKey: String?
    var id: Int?
    var multiple: Bool?
    var selected: Bool?
    var style: Int?
    var extInfo: String?

    var subItems: [ESFFilterItemModel]?

    required init?(map: Map) {
    }

    func mapping(map: Map) {
        depth <- map["depth"]
        maxDepth <- map["maxDepth"]
        displayText <- map["displayText"]
        filterKey <- map["filterKey"]
        fullFilterKey <- map["fullFilterKey"]
        id <- map["id"]
        multiple <- map["multiple"]
        selected <- map["selected"]
        style <- map["style"]
        extInfo <- map["extInfo"]

        subItems <- map["subItems"]

    }
}

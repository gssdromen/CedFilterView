//
//  NSAttributedStringExtension.swift
//  JingJiRen_ESF_iOS
//
//  Created by 张灿 on 17/1/11.
//  Copyright © 2017年 Cedric Wu. All rights reserved.
//

import Foundation

extension NSMutableAttributedString {
    ///返回在指定宽度下等字间距的AttributedString
    class func equalWordSpaceingAttributedString(text: String, fixWidth: CGFloat, font: UIFont) -> NSMutableAttributedString {
        let mulAttrString = NSMutableAttributedString(string: text, attributes: [NSFontAttributeName: font])
        var spaceing: CGFloat = 0
        let str = text as NSString
        let size = str.size(attributes: [NSFontAttributeName: font])
        if str.length > 1 {
            spaceing = (fixWidth - size.width)/CGFloat((str.length-1))
            if spaceing > 0 {
                mulAttrString .addAttributes([NSKernAttributeName: spaceing], range: NSRange.init(location: 0, length: str.length - 1))
            }
        }
       return mulAttrString
    }
}

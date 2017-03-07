//
//  UILabelExtension.swift
//  JingJiRen_ESF_iOS
//
//  Created by 张灿 on 17/2/21.
//  Copyright © 2017年 Cedric Wu. All rights reserved.
//

import UIKit

extension UILabel {
    ///当前字数与总字数的格式,字体按当前label的字体
    func setWordLimitAttributedString(curCount: String, maxCount: String) {
         let mulAttrString = NSMutableAttributedString()
        let curCountAttr = NSAttributedString(string: curCount, attributes: [NSFontAttributeName: self.font, NSForegroundColorAttributeName: UIColor(hex6:0x212121)])
        mulAttrString.append(curCountAttr)
        let maxCountAttr =  NSAttributedString(string: "/\(maxCount)", attributes: [NSFontAttributeName: self.font, NSForegroundColorAttributeName: UIColor(hex6:0x888888)])
        mulAttrString.append(maxCountAttr)
        attributedText = mulAttrString
    }
}

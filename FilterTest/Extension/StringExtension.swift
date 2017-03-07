//
//  StringExtension.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 1/27/16.
//  Copyright © 2016 FangDuoDuo. All rights reserved.
//

import Foundation

extension String {
//    func sha1() -> String {
//        let data = self.dataUsingEncoding(NSUTF8StringEncoding)!
//        var digest = [UInt8](count: Int(CC_SHA1_DIGEST_LENGTH), repeatedValue: 0)
//        CC_SHA1(data.bytes, CC_LONG(data.length), &digest)
//        let hexBytes = digest.map { String(format: "%02hhx", $0) }
//        return hexBytes.joinWithSeparator("")
//    }

    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)

        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)

        return boundingBox.height
    }

    func sizeWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGSize {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)

        let boundingBox = self.boundingRect(with: constraintRect, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)

        return boundingBox.size
    }

    func isNumberWithMostTwoDecimal() -> Bool {
        return self.checkRegex("\\d*(\\.\\d{0,2})?")
    }

    func isPhoneNumber() -> Bool {
        return self.checkRegex("^\\d{11}$")
    }

    func checkRegex(_ reg: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", reg)
        let result = test.evaluate(with: self)
        return result
    }

    func messUpPhoneNumber() -> String {
        if self.isPhoneNumber() {
            let index1 = self.characters.index(self.startIndex, offsetBy: 3)
            let index2 = self.characters.index(self.endIndex, offsetBy: -4)
            return self.substring(to: index1) + "****" + self.substring(from: index2)
        } else {
            return self
        }
    }

    func pickWordsWithRegex(_ reg: String) -> [String] {
        var result = [String]()
        do {
            let regex = try NSRegularExpression(pattern: reg, options: NSRegularExpression.Options.caseInsensitive)
            let array = regex.matches(in: self, options: NSRegularExpression.MatchingOptions.reportCompletion, range: NSMakeRange(0, self.characters.count))
            for range in array {
                let startIndex = self.characters.index(self.startIndex, offsetBy: range.range.location)
                let endIndex = self.characters.index(self.startIndex, offsetBy: range.range.location + range.range.length)
                result.append(self.substring(with: startIndex ..< endIndex))
            }
        } catch {

        }
        return result
    }

    func urlEncode() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    // 返回第一个名字
    func getIconName() -> String {
        if self.characters.count == 1 {
            return self
        }

        let str = self as NSString
        let sss = str.substring(to: 1).cString(using: String.Encoding.utf8)
        if strlen(sss) == 1 {
            return str.substring(to: 2)
        } else {
            return str.substring(to: 1)
        }
        return ""
    }

}

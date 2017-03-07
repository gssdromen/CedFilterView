//
//  UIView+CedFrame.swift
//  swiftTest
//
//  Created by Cedric Wu on 2/26/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit

extension UIView {

    func storeAndCleanInstalledConstraints() {
        var list = [NSLayoutConstraint]()
        if let constraints = self.superview?.constraints {
            for c in constraints {
                if c.firstItem as? UIView == self || c.secondItem as? UIView == self {
                    list.append(c)
                }
            }
        }

        self.superview?.removeConstraints(list)
        self.removeConstraints(self.constraints)
    }

    func restoreInstalledConstraints() {
        var key = "InstalledConstraints"
        if let constraints = objc_getAssociatedObject(self, &key) as? [NSLayoutConstraint] {
            self.addConstraints(constraints)
        }
    }

    func getAutoLayoutedSize() -> CGSize {
        return self.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
    }

    var visible: Bool {
        get {
            return !self.isHidden
        }
        set {
            self.isHidden = !newValue
        }
    }

    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }

    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }

    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }

    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }

    var maxY: CGFloat {
        return self.y + self.height
    }

    var maxX: CGFloat {
        return self.x + self.width
    }

    var centerPoint: CGPoint {
        get {
            return CGPoint(x: self.x + self.width / 2, y: self.y + self.height / 2)
        }
        set {
            self.x = newValue.x - self.width / 2
            self.y = newValue.y - self.height / 2
        }
    }
}

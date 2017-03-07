//
//  UIViewExtension.swift
//  JingJiRen_ESF_iOS
//
//  Created by gssdromen on 9/20/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit
import QuartzCore

extension UIView {
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }

    func drawRectWithRoundedCorner(radius: CGFloat,
                                   borderWidth: CGFloat,
                                   backgroundColor: UIColor,
                                   borderColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        let borderFrame = CGRect(x: bounds.origin.x + borderWidth, y: bounds.origin.y + borderWidth, width: bounds.width - borderWidth, height: bounds.height - borderWidth)

        backgroundColor.setFill()
        borderColor.setStroke()
        context?.setLineWidth(borderWidth)
        context?.move(to: CGPoint(x: radius, y: borderFrame.origin.y))
        context?.addArc(tangent1End: CGPoint(x: borderFrame.origin.x, y: borderFrame.origin.y), tangent2End: CGPoint(x: borderFrame.origin.x, y: radius), radius: radius)
        context?.addArc(tangent1End: CGPoint(x: borderFrame.origin.x, y: borderFrame.height), tangent2End: CGPoint(x: radius, y: borderFrame.height), radius: radius)
        context?.addArc(tangent1End: CGPoint(x: borderFrame.width, y: borderFrame.height), tangent2End: CGPoint(x: borderFrame.width, y: borderFrame.height - radius), radius: radius)
        context?.addArc(tangent1End: CGPoint(x: borderFrame.width, y: borderFrame.origin.y), tangent2End: CGPoint(x: borderFrame.width - radius, y: borderFrame.origin.y), radius: radius)
        context?.addLine(to: CGPoint(x: radius, y: borderFrame.origin.y))

        context?.drawPath(using: CGPathDrawingMode.fillStroke)
        let output = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return output!
    }

    func addCorner(radius: CGFloat, borderWidth: CGFloat, backgroundColor: UIColor, borderColor: UIColor) {
        let imageView = UIImageView(image: drawRectWithRoundedCorner(radius: radius, borderWidth: borderWidth, backgroundColor: backgroundColor, borderColor: borderColor))
        self.insertSubview(imageView, at: 0)
    }

    /// 画虚线
    ///
    /// - Parameters:
    ///   - frame: 虚线的frame
    ///   - color: 虚线的颜色
    ///   - horizeontal: 水平还是垂直
    /// - Returns: UIImageView
    class func createDottedLine(frame: CGRect, color: UIColor, horizeontal: Bool = true) -> UIImageView {

        let imageView = UIImageView(frame: frame)

        imageView.backgroundColor = UIColor.clear

        UIGraphicsBeginImageContext(frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        let line = UIGraphicsGetCurrentContext()
        line?.setLineCap(CGLineCap.round)
        line?.setStrokeColor(color.cgColor)
        line?.setLineDash(phase: min(frame.size.width, frame.size.height), lengths: [4, 4])
        line?.move(to: CGPoint.zero)

        if horizeontal {
            line?.addLine(to: CGPoint(x: frame.size.width, y: 0))
        } else {
            line?.addLine(to: CGPoint(x: 0, y: frame.size.height))
        }

        line?.strokePath()
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageView
    }

    /// 设置uiview的边框和圆角
    ///
    /// - Parameters:
    ///   - radius: 圆角角度
    ///   - color: 边线的颜色
    func borderAndCornerRadius(radius: CGFloat = 3, color: UIColor = ESFColorDefine.DescTextColor) {
        self.layer.cornerRadius = radius
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }
}

//
//  UINavigationControllerExtension.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 16/5/26.
//  Copyright © 2016年 FangDuoDuo. All rights reserved.
//

import Foundation

extension UINavigationController {
    func popSelfAndPushToViewController(_ vc: UIViewController) {
        self.popNumberOfLastViewControllersAndPushToViewController(1, vc: vc)
    }

    func popNumberOfLastViewControllersAndPushToViewController(_ number: Int, vc: UIViewController?) {
        var vcList = self.viewControllers
        if vcList.count > number && number >= 0 {
            for _ in 0 ..< number {
                vcList.removeLast()
            }
            if vc != nil {
                vcList.append(vc!)
            }

            self.setViewControllers(vcList, animated: true)
        }

    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if self.topViewController != nil {
            return self.topViewController!.preferredStatusBarStyle
        } else {
            return UIStatusBarStyle.default
        }

    }
}

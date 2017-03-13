//
//  CedFilterModel.swift
//  SecondHandHouseBroker
//
//  Created by Cedric Wu on 3/19/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit

class SectionView: UIView {
    var titleLabel = UILabel()
    var icon = UIImageView()
    var sepLine = UIView()

    // MARK: - Public Methods
    func setSectionViewSelect(flag: Bool) {
        let image = flag ? UIImage(named: "ic_houselist_filterView_open", in: Bundle(for: type(of: self)), compatibleWith: nil) : UIImage(named: "ic_houselist_filterView_expand", in: Bundle(for: type(of: self)), compatibleWith: nil)

        icon.image = image
    }

    // MARK: - Views About
    func layoutViews() {
        titleLabel.frame = CGRect(x: 11, y: 0, width: self.bounds.width - 16 - 11 - 10, height: self.bounds.height)
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        sepLine.frame = CGRect(x: self.bounds.width - 1, y: 10, width: 1, height: 14)
        let temp: Float = 208 / 255
        sepLine.backgroundColor = UIColor(colorLiteralRed: temp, green: temp, blue: temp, alpha: 1.0)

        icon.frame = CGRect(x: self.bounds.width - 16 - 11, y: self.bounds.height / 2 - 2, width: 11, height: 7)

        let image = UIImage(named: "ic_houselist_filterView_expand", in: Bundle(for: type(of: self)), compatibleWith: nil)
        icon.image = image
        self.addSubview(self.titleLabel)
        self.addSubview(self.icon)
        self.addSubview(self.sepLine)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.layoutViews()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

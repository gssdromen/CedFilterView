//
//  ESFBaseTableViewCell.swift
//  JingJiRen_ESF_iOS
//
//  Created by Cedric Wu on 9/9/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit

open class ESFBaseTableViewCell: UITableViewCell {

    var needsLayout = true
    override open class var requiresConstraintBasedLayout: Bool {
        get {
            return true
        }
    }

    // MARK: - Views About
    open func initMyViews() {

    }

    open func addMyViews() {

    }

    open func layoutMyViews() {

    }

    // MARK: - Life Cycle
    override open func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initMyViews()
        self.addMyViews()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        if needsLayout {
            if ESFBaseTableViewCell.requiresConstraintBasedLayout == false {

            }
            layoutMyViews()
        }
    }

    open override func updateConstraints() {
        if needsLayout {
            if ESFBaseTableViewCell.requiresConstraintBasedLayout == true {
                layoutMyViews()
            }
        }
        super.updateConstraints()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override open func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

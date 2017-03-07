//
//  ESFHouseFilterLeftCell.swift
//  JingJiRen_ESF_iOS
//
//  Created by gssdromen on 28/09/2016.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit

class ESFHouseFilterLeftCell: ESFHouseFilterCell {

    // MARK: - Public Methods

    // MARK: - Life Cycle
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.font = UIFont.systemFont(ofSize: 14)
        self.backgroundColor = UIColor(hex6: 0xf5f5f5)

        let bgView = UIView()
        bgView.backgroundColor = UIColor.white
        self.selectedBackgroundView = bgView
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

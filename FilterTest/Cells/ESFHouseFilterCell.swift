//
//  ESFHouseFilterCell.swift
//  JingJiRen_ESF_iOS
//
//  Created by Cedric Wu on 23/09/2016.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit
import SnapKit

class ESFHouseFilterCell: ESFBaseTableViewCell {
    let gou = UIImageView()

    // MARK: - Public Methods
    func setMajorSelect(flag: Bool, str: String, col: Int) {
        self.gou.visible = flag
        self.textLabel?.textColor = flag ? UIColor(hex6: 0xF24500) : UIColor(hex6: 0x212121)
        self.textLabel?.text = str
        self.backgroundColor = flag ? UIColor(hex6: 0xF5F5F5) : UIColor.white
    }

    func setMinorSelect(flag: Bool, str: String, col: Int) {
        self.gou.visible = false
        self.textLabel?.textColor = flag ? UIColor(hex6: 0xF24500) : UIColor(hex6: 0x212121)
        self.textLabel?.text = str
        self.backgroundColor = flag ? UIColor.white : UIColor(hex6: 0xf5f5f5)

    }

    // MARK: - Life Cycle
    override func initMyViews() {
        super.initMyViews()
        self.gou.image = UIImage(named: "ic_ESFHouseList_Gou")
    }

    override func addMyViews() {
        super.addMyViews()
        self.contentView.addSubview(self.gou)

        let bgView = UIView()
        bgView.backgroundColor = UIColor(hex6: 0xf5f5f5)
        self.selectedBackgroundView = bgView
    }

    override func layoutMyViews() {
        super.layoutMyViews()

        self.gou.snp.makeConstraints { (make) in
            make.width.equalTo(18)
            make.height.equalTo(13)
            make.right.equalTo(self.contentView).offset(-24)
            make.centerY.equalTo(self.textLabel!)
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.textLabel?.font = UIFont.systemFont(ofSize: 14)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

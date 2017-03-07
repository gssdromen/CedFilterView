//
//  ESFCountDownCell1.swift
//  JingJiRen_ESF_iOS
//
//  Created by cedricwu on 12/30/16.
//  Copyright © 2016 Cedric Wu. All rights reserved.
//

import UIKit

class ESFCountDownCell1: ESFBaseTableViewCell {
    let mainLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 14)
        return v
    }()

    let extraLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFont(ofSize: 10)
        v.textColor = UIColor(hex6: 0x888888)
        return v
    }()

    let gou: UIImageView = {
        let v = UIImageView()
        v.image = UIImage(named: "ic_ESFHouseList_Gou")
        return v
    }()

    // MARK: - Public Methods
    func fillWith(mainTitle: String, extraTitle: String) {
        mainLabel.text = mainTitle
        extraLabel.text = extraTitle
    }

    func setSelect(flag: Bool) {
        mainLabel.textColor = flag ? UIColor(hex6: 0xF24500) : UIColor(hex6: 0x212121)
        gou.visible = flag
    }

    // MARK: - Views About
    override func initMyViews() {
        super.initMyViews()

        gou.visible = false
    }

    override func addMyViews() {
        super.addMyViews()
        contentView.addSubview(mainLabel)
        contentView.addSubview(extraLabel)
        contentView.addSubview(gou)
    }

    override func layoutMyViews() {
        super.layoutMyViews()
        mainLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(7)
            make.left.equalTo(contentView).offset(12)
        }
        extraLabel.snp.makeConstraints { (make) in
            make.top.equalTo(contentView).offset(26)
            make.left.equalTo(contentView).offset(12)
        }
        gou.snp.makeConstraints { (make) in
            make.width.equalTo(18)
            make.height.equalTo(13)
            make.right.equalTo(contentView).offset(-24)
            make.centerY.equalTo(contentView)
        }
    }

    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

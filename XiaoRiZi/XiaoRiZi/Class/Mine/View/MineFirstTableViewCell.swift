//
//  MineFirstTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/26.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class MineFirstTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var iconWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        iconWidth.constant *= KScaleW
        iconImage.layer.cornerRadius = iconWidth.constant / 2
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

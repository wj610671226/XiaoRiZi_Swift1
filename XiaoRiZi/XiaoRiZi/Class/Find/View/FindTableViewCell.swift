//
//  FindTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/16.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class FindTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func findTableView(tableview: UITableView) -> FindTableViewCell {
        let cellID = "findTableViewCellID"
        var cell = tableview.dequeueReusableCellWithIdentifier(cellID) as? FindTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("FindTableViewCell", owner: nil, options: nil).last as? FindTableViewCell
        }
        return cell!
    }
}

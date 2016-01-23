//
//  ExploreTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/21.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ExploreTableViewCell: UITableViewCell {

    /// 图片
    @IBOutlet weak var img: UIImageView!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    /// 地址
    @IBOutlet weak var addressLabel: UILabel!
    /// 关键字
    @IBOutlet weak var dayWordLabel: UILabel!
    
    static func cellWithTableView(tableView: UITableView) -> ExploreTableViewCell {
        let cellID = "exploreCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? ExploreTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ExploreTableViewCell", owner: nil, options: nil).last! as? ExploreTableViewCell
        }
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .None
        // Configure the view for the selected state
    }
    
}

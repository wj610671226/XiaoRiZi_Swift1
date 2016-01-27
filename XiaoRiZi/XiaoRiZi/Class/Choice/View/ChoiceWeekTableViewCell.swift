//
//  ChoiceWeekTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/21.
//  Copyright © 2016年 ty. All rights reserved.
//  周末，好玩  点击进去的cell

import UIKit

class ChoiceWeekTableViewCell: UITableViewCell {

    /// 图片
    @IBOutlet weak var imgView: UIImageView!
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    /// tag
    @IBOutlet weak var tagLabel: UILabel!
    
    var weekModel: WeekModel? {
        didSet {
            imgView.sd_setImageWithURL(NSURL(string: (weekModel?.imgs![0])!))
            titleLabel.text = weekModel?.title
            tagLabel.text = weekModel?.tag
        }
    }
    
    static func cellWithTableView(tableView: UITableView) -> ChoiceWeekTableViewCell {
        let cellID = "weekCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? ChoiceWeekTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ChoiceWeekTableViewCell", owner: nil, options: nil).last as? ChoiceWeekTableViewCell
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

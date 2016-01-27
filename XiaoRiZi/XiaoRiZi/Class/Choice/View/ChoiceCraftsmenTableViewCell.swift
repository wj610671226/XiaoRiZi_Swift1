//
//  ChoiceCraftsmenTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/21.
//  Copyright © 2016年 ty. All rights reserved.
//  匠人，志  点击进去的cell

import UIKit

class ChoiceCraftsmenTableViewCell: UITableViewCell {

    /// 图片
    @IBOutlet weak var img: UIImageView!
    /// 头像
    @IBOutlet weak var iconImageView: UIImageView!
    /// 姓名
    @IBOutlet weak var nameLabel: UILabel!
    /// tag And 工作室
    @IBOutlet weak var tagAndWorkroomLabel: UILabel!
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    var model: CiaftsmenModel? {
        didSet {
            img.sd_setImageWithURL(NSURL(string: model!.img!))
            iconImageView.sd_setImageWithURL(NSURL(string: model!.head_photo!))
            nameLabel.text = model!.name ?? ""
            tagAndWorkroomLabel.text = model!.tag! + model!.workroom!
            titleLabel.text = model!.title
        }
    }
    
    static func cellWithTableView(tableView: UITableView) -> ChoiceCraftsmenTableViewCell {
        let cellID = "craftsmenCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? ChoiceCraftsmenTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ChoiceCraftsmenTableViewCell", owner: nil, options: nil).last as? ChoiceCraftsmenTableViewCell
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

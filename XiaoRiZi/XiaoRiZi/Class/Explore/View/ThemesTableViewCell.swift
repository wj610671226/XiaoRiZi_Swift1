//
//  ThemesTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/30.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ThemesTableViewCell: UITableViewCell {

    /// 图片
    @IBOutlet weak var img: UIImageView!
    
    /// 标题了
    @IBOutlet weak var titleLabel: UILabel!
    
    /// tag
    @IBOutlet weak var tagLabel: UILabel!
    
    var model: ThemesModel? {
        didSet {
            img!.downLoadImage((model?.img)!)
            titleLabel.text = model?.title
            tagLabel.text = model?.tag
        }
    }
    
    static func cellWithTableView(tableView: UITableView) -> ThemesTableViewCell {
        let cellID = "themesCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? ThemesTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ThemesTableViewCell", owner: nil, options: nil).last! as? ThemesTableViewCell
        }
        return cell!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  ItemTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/30.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var addressLabel: UILabel!
    
    var model: FindItemModel? {
        didSet {
            img.downLoadImage(model!.img!)
            titleLabel.text = model!.title
            addressLabel.text = model!.address
        }
    }
    
    static func cellWithTableView(tableView: UITableView) -> ItemTableViewCell {
        let cellID = "itemCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? ItemTableViewCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("ItemTableViewCell", owner: nil, options: nil).last as? ItemTableViewCell
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

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
    
    /// 喜欢按钮
    @IBOutlet weak var likeBtn: UIButton!
    var weekModel: WeekModel? {
        didSet {
            imgView.downLoadImage((weekModel?.imgs![0])!)
            titleLabel.text = weekModel?.title
            tagLabel.text = weekModel?.tag
            // 实际开发 考虑重用问题 根据model设置按钮的selected 属性
            likeBtn.selected = false
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
    
    // MARK: 点击喜欢按钮
    @IBAction func processLikeBtn(sender: UIButton) {
        sender.selected = !sender.selected
        let alertView = UIAlertView(title: "提示", message: "实际开发考虑重用问题", delegate: nil, cancelButtonTitle: "确定")
        alertView.show()
        // 写入数据库 或者 服务器
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

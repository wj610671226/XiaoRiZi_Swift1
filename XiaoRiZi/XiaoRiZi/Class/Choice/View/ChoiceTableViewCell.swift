//
//  ChoiceTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/15.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ChoiceTableViewCell: UITableViewCell {

    /// 图片
    var backImageView: UIImageView!
    
    /// 标题
    var titleLabel: UILabel!
    /// tag 子标题
    var tagLabel: UILabel!
    
    /// 标题 和 子标题的 backView
    var backView: UIView!
    
    var choiceLineView: ChoiceLineView!
    
    /// 模型数据
    var model: ChoiceListModel? {
        // 设置数据
        didSet {
            // 图片
            backImageView.sd_setImageWithURL(NSURL(string: (model?.img)!))
            
            // 标题
            titleLabel.text = model?.title ?? ""
            
            // 子标题
            tagLabel.text = model?.tag ?? ""
            
            tagLabel.hidden = model?.title == model?.tag
            choiceLineView.hidden = !(model?.title == model?.tag)
        }
    }

    class func initWithCustomCell(tableView: UITableView) -> ChoiceTableViewCell {
        let cellID = "choiceCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? ChoiceTableViewCell
        if cell == nil {
            cell = ChoiceTableViewCell(style: .Default, reuseIdentifier: cellID)
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // 图片
        backImageView = UIImageView()
        contentView.addSubview(backImageView)
        
        // backview
        backView = UIView()
        backView.backgroundColor = UIColor.clearColor()
        contentView.addSubview(backView)
        
        // titleLabel
        titleLabel = UILabel()
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(20)
        backView.addSubview(titleLabel)
        
        // tagLabel
        tagLabel = UILabel()
        tagLabel.textColor = UIColor.whiteColor()
        tagLabel.textAlignment = .Center
        tagLabel.font = UIFont.systemFontOfSize(15)
        backView.addSubview(tagLabel)
        
        choiceLineView = ChoiceLineView()
        choiceLineView.backgroundColor = UIColor.clearColor()
        backView.addSubview(choiceLineView)
    }

    // 重新调整子视图的大小
    override func layoutSubviews() {
        super.layoutSubviews()
        backImageView.frame = CGRect(x: 0, y: 5, width: KmainScreenW, height:contentView.bounds.height - 5)
        
        titleLabel.sizeToFit()
        tagLabel.frame = CGRect(x: 0, y: titleLabel.bounds.height, width: 0, height: 0)
        tagLabel.sizeToFit()
        tagLabel.center = CGPoint(x: titleLabel.bounds.width / 2, y: tagLabel.bounds.height / 2 + titleLabel.bounds.height)
        
        let backViewH: CGFloat = titleLabel.bounds.height + tagLabel.bounds.height
        backView.frame = CGRect(x: 0, y: 0, width: titleLabel.bounds.width, height: backViewH)
        backView.center = CGPoint(x: KmainScreenW / 2, y: contentView.bounds.height / 2)
        
        let choiceLineViewH: CGFloat = 5
        choiceLineView.frame = CGRect(x: 0, y: 0, width: titleLabel.bounds.width + 50, height: choiceLineViewH)
        choiceLineView.center = CGPoint(x: backView.bounds.width / 2, y: titleLabel.bounds.height + choiceLineViewH)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

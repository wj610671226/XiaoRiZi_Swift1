//
//  ChoiceDetailTableViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

/**
 *  点击按钮的代理。进入对应的页面
 */
protocol ChoiceDetailTableViewCellDelegate: class {
    /**
     进入详细页面
     
     - parameter detailUrlString: url地址
     */
    func processBtnPushDetailViewController(currentBtnTitle: String)
}

class ChoiceDetailTableViewCell: UITableViewCell {

    /// 代理
    weak var delegate: ChoiceDetailTableViewCellDelegate?

    // 顶部的视图
    private var topView: ChoiceDetailTopView?
    
    /// 中间的视图
    private var middleView: ChoiceDetailBottomView?
    
    /// 底部的视图
    private var bottomView: ChoiceDetailBottomView?
    
    /// 数据模型
    var detailModel: ChoiceDetailModel? {
        didSet {
            // 给模型赋值
            // 把 topView（按钮） titleLabel作为时间显示
            topView?.timeLabel?.text = detailModel?.date ?? ""
            topView?.model = detailModel?.article![(topView?.tag)!]
            
            middleView?.model = detailModel?.article![(middleView?.tag)!]
            bottomView?.model = detailModel?.article![(bottomView?.tag)!]
        }
    }
    
    // 快速创建cell
    static func cellWithTableView(tableView: UITableView, indexPath: NSIndexPath) -> ChoiceDetailTableViewCell {
        let cellID = "ChoiceDetailTableViewCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? ChoiceDetailTableViewCell
        if cell == nil {
//            cell = ChoiceDetailTableViewCell(style: .Default, reuseIdentifier: cellID)
            cell = ChoiceDetailTableViewCell(style: .Default, reuseIdentifier: cellID, indexPath: indexPath)
        }
        return cell!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, indexPath: NSIndexPath) {
        
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        // topView
        let topView = ChoiceDetailTopView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KtopViewH))
        // 设置标题  便于找到对应的模型进入详细页面
        topView.titleLabel?.text = "\(indexPath.row)" + "0"
        // 设置tag 值便于赋值
        topView.tag = 0
        contentView.addSubview(topView)
        topView.addTarget(self, action: "processBtnDetail:", forControlEvents: .TouchDown)
        self.topView = topView
        
        // bottomView
        let bottomViewH: CGFloat = KbottomViewH
        let bottomViewY: CGFloat = CGRectGetMaxY(topView.frame)
        for index in 0...1 {
            let bottomView = ChoiceDetailBottomView(frame: CGRect(x: 0, y: (Kpadding + bottomViewH) * CGFloat(index) + bottomViewY, width: KmainScreenW, height: bottomViewH))
            contentView.addSubview(bottomView)
            bottomView.tag = index + 1
            bottomView.titleLabel?.text = "\(indexPath.row)" + "\(bottomView.tag)"
            bottomView.addTarget(self, action: "processBtnDetail:", forControlEvents: .TouchDown)
            
            
            if index == 0 {
                
                self.middleView = bottomView
                
                // 添加横线
                let lineImageViewH: CGFloat = 2
                let lineImageViewY: CGFloat = CGRectGetMaxY(bottomView.frame) + (Kpadding - lineImageViewH + Kpadding / 2) / 2
                let lineImageView = UIImageView(frame: CGRect(x: Kpadding, y: lineImageViewY, width: KmainScreenW - 2 * Kpadding, height: lineImageViewH))
                contentView.addSubview(lineImageView)
                lineImageView.image = UIImage(named: "cline")
            } else {
                self.bottomView = bottomView
            }
        }
    }
//    // 构建子视图
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        // topView
//        let topView = ChoiceDetailTopView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KtopViewH))
//        topView.tag = 0
//        contentView.addSubview(topView)
//        topView.addTarget(self, action: "processBtnDetail:", forControlEvents: .TouchDown)
//        self.topView = topView
//        
//        // bottomView
//        let bottomViewH: CGFloat = KbottomViewH
//        let bottomViewY: CGFloat = CGRectGetMaxY(topView.frame)
//        for index in 0...1 {
//            let bottomView = ChoiceDetailBottomView(frame: CGRect(x: 0, y: (Kpadding + bottomViewH) * CGFloat(index) + bottomViewY, width: KmainScreenW, height: bottomViewH))
//            contentView.addSubview(bottomView)
//            bottomView.tag = index + 1
//            bottomView.addTarget(self, action: "processBtnDetail:", forControlEvents: .TouchDown)
//            
//            
//            if index == 0 {
//                
//                self.middleView = bottomView
//                
//                // 添加横线 
//                let lineImageViewH: CGFloat = 2
//                let lineImageViewY: CGFloat = CGRectGetMaxY(bottomView.frame) + (Kpadding - lineImageViewH + Kpadding / 2) / 2
//                let lineImageView = UIImageView(frame: CGRect(x: Kpadding, y: lineImageViewY, width: KmainScreenW - 2 * Kpadding, height: lineImageViewH))
//                contentView.addSubview(lineImageView)
//                lineImageView.image = UIImage(named: "cline")
//            } else {
//                self.bottomView = bottomView
//            }
//        }
//    }

    // MARK: processBtnDetail
    func processBtnDetail(sender: UIButton) {
        delegate?.processBtnPushDetailViewController((sender.titleLabel?.text)!)
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

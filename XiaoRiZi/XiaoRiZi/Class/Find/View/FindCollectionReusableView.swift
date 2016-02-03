//
//  FindCollectionReusableView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/23.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class FindCollectionReusableView: UICollectionReusableView {
    
    /// 存储按钮的数组
    private lazy var btnArray: [BaseButton] = Array()
    
    private lazy var lastBtn: BaseButton = BaseButton(frame: CGRect(x: 0, y: 40, width: 0, height: 0))
    
    private weak var titleLabel: UILabel?
    /// 热门搜索
    var hot: String? {
        didSet {
            reusableViewAddAllSubviews(hot!)
        }
    }
    
    /**
     获取reusableView的动态高度
     */
    func reusableViewAddAllSubviews(hot: String) -> CGFloat {
        // 添加按钮
        addChooseButton(hot)
        
        // 调整按钮的位置
        adjustButtonFrame()
        
        // 添加按钮
        addTitle()
        
        return CGRectGetMaxY(titleLabel!.frame) + Kpadding
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 标题
        let searchTitle = UILabel()
        searchTitle.text = "大家都在搜"
        searchTitle.font = UIFont.systemFontOfSize(18)
        searchTitle.sizeToFit()
        searchTitle.frame.origin.x = Kpadding
        searchTitle.frame.origin.y = Kpadding
        self.addSubview(searchTitle)
    }

    // MARK: 添加按钮
    private func addChooseButton(hot: String) {
        // 分解成数组
        let stringArray = hot.componentsSeparatedByString(",")
        if stringArray.count == 0 {
            return
        }
        
        // 添加按钮
        for obj in stringArray {
            let btn = BaseButton()
            btn.setTitle(obj, forState: .Normal)
            btn.titleLabel?.textColor = UIColor.blackColor()
            btn.setBackgroundImage(UIImage.imageStretch("anniu_2"), forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn.addTarget(self, action: "processChooseBtn:", forControlEvents: .TouchDown)
            self.addSubview(btn)
            
            btnArray.append(btn)
        }
    }
    
    // MARK: 调整按钮的位置
    private func adjustButtonFrame() {
        for value in btnArray {
            value.titleLabel?.font = UIFont.systemFontOfSize(15)
            value.titleLabel!.sizeToFit()
            value.frame.size.width = value.titleLabel!.frame.width + Kpadding * 2
            value.frame.size.height = value.titleLabel!.frame.height + Kpadding
            if value.frame.size.width + CGRectGetMaxX(lastBtn.frame) + Kpadding >= KmainScreenW {
                value.frame.origin.x = Kpadding
                value.frame.origin.y = CGRectGetMaxY(lastBtn.frame) + Kpadding
            } else {
                value.frame.origin.x = CGRectGetMaxX(lastBtn.frame) + Kpadding
                value.frame.origin.y = CGRectGetMinY(lastBtn.frame)
            }
            lastBtn = value
        }
    }

    // MARK: 添加标题
    private func addTitle() {
        // title
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFontOfSize(18)
        titleLabel.text = "闲时光 · 发现 · 惊喜"
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = Kpadding
        titleLabel.frame.origin.y = CGRectGetMaxY(btnArray.last!.frame) + Kpadding * 3
        self.addSubview(titleLabel)
        self.titleLabel = titleLabel
    }
    
    // MARK: 点击按钮
    func processChooseBtn(sender: BaseButton) {
        print("title = \(sender.titleLabel?.text)")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

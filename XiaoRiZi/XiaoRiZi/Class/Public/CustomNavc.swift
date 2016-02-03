//
//  CustomNavc.swift
//  XiaoRiZi
//
//  Created by ty on 16/2/1.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class CustomNavc: UIView {

    /// 返回按钮
    weak var backBtn: BaseButton?
    /// 分享按钮
    weak var shareBtn: BaseButton?
    /// 收藏按钮
    weak var collectBtn: BaseButton?
    
    /// 子控件的高度
    private let btnH: CGFloat = 44
    /// 子控件的Y值
    private let btnY: CGFloat = 20
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        // 返回按钮
        let backBtn = BaseButton(type: UIButtonType.Custom)
        backBtn.frame = CGRect(x: 0, y: btnY, width: 50, height: btnH)
        backBtn.setImage(UIImage(named: "back_0"), forState: .Normal)
        self.addSubview(backBtn)
        self.backBtn = backBtn
        
        // 分享按钮
        let shareBtn = BaseButton(type: UIButtonType.Custom)
        let shareBtnW: CGFloat = 50
        let shareBtnX = KmainScreenW - shareBtnW
        shareBtn.frame = CGRect(x: shareBtnX, y: btnY, width: shareBtnW, height: btnH)
        shareBtn.setImage(UIImage(named: "share_0"), forState: .Normal)
        self.addSubview(shareBtn)
        shareBtn.addTarget(self, action: "processShareMessage", forControlEvents: .TouchDown)
        self.shareBtn = shareBtn
        
        // 收藏按钮
        let collectBtn = BaseButton(type: UIButtonType.Custom)
        let collectBtnW: CGFloat = CGRectGetWidth(shareBtn.frame)
        let collectBtnX = KmainScreenW - collectBtnW - shareBtnW
        collectBtn.frame = CGRect(x: collectBtnX, y: btnY, width: collectBtnW, height: btnH)
        collectBtn.setImage(UIImage(named: "collect_0"), forState: .Normal)
        collectBtn.setImage(UIImage(named: "collect_2"), forState: .Selected)
        collectBtn.addTarget(self, action: "processCollectBtn:", forControlEvents: .TouchDown)
        self.addSubview(collectBtn)
        self.collectBtn = collectBtn
    }
    
    // MARK: 收藏
    func processCollectBtn(sender: BaseButton) {
        sender.selected = !sender.selected
        NSNotificationCenter.defaultCenter().postNotificationName(CollectBtnSelectedChangeName, object: sender.selected)
        // 写入数据到数据库 或者其他方式记录信息
    }

    // MARK: 分享
    func processShareMessage() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

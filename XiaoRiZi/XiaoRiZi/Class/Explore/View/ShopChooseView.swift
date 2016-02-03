//
//  ShopChooseView.swift
//  XiaoRiZi
//
//  Created by ty on 16/2/1.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ShopChooseView: UIView {

    ///滑动线
    private weak var sliderLineView: UIView?
    /// 动画时间
    private let animationTime: Double = 0.3
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()

        let btnW = KmainScreenW / 2
        // 添加按钮
        for index in 0...1 {
            let btn = BaseButton()
            btn.tag = index
            btn.titleLabel?.font = UIFont.systemFontOfSize(18)
            btn.addTarget(self, action: "processChooseBtn:", forControlEvents: .TouchDown)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            self.addSubview(btn)
            btn.frame = CGRect(x: CGFloat(index) * btnW, y: 0, width: btnW, height: bounds.height)
            if index == 0 {
                btn.setTitle("店 · 发现", forState: .Normal)
            } else {
                btn.setTitle("店 · 详情", forState: .Normal)
            }
        }
        
        // 添加竖线
        let middleView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: bounds.height - Kpadding * 2))
        middleView.backgroundColor = UIColor.lightGrayColor()
        middleView.center = CGPointMake(KmainScreenW / 2, bounds.height / 2)
        self.addSubview(middleView)
        
        // 添加横线
        let lineView = UIView(frame: CGRect(x: 0, y: 0, width: btnW - 4 * Kpadding, height: 1))
        lineView.backgroundColor = UIColor.blackColor()
        lineView.center = CGPointMake(btnW / 2, bounds.height - 5)
        self.addSubview(lineView)
        sliderLineView = lineView
    }

    // MARK: 点击按钮
    func processChooseBtn(sender: BaseButton) {
        if sender.tag == 0 {
            UIView.animateWithDuration(animationTime) { () -> Void in
                self.sliderLineView?.transform = CGAffineTransformIdentity
            }
        } else {
            UIView.animateWithDuration(animationTime) { () -> Void in
                self.sliderLineView?.transform = CGAffineTransformMakeTranslation(KmainScreenW / 2, 0)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

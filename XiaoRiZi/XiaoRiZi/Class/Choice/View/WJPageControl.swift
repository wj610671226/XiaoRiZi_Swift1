//
//  WJPageControl.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/27.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class WJPageControl: UIPageControl {

    /// 记录上一次的page
    private var lastPageItme: BaseButton?
    
    /// 重写属性
    override var currentPage: Int {
        didSet {
            if currentPage < 0 || currentPage > self.subviews.count {
                return
            }
            
            if lastPageItme != nil {
                lastPageItme?.selected = false
            }
            
            for obj in self.subviews {
                if obj is BaseButton {
                    // 设置当前按钮的选中状态
                    let btn = self.subviews[currentPage] as! BaseButton
                    btn.selected = true
                    lastPageItme = btn
                } else {
                    // 移除其他无关的视图
                    obj.removeFromSuperview()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(frame: CGRect, itemSize: CGSize, pageNumber: Int, normalImageName: String, selectedImageName: String) {
        self.init(frame: frame)
        // 实现这一步赋值  重写currentPage 才能获取外界负的值
        self.numberOfPages = pageNumber
        let number: CGFloat = CGFloat(pageNumber)
        let btnW = itemSize.width
        let btnH = itemSize.height
        let btnY = (frame.height - btnH) / 2
        let btnX: CGFloat = (frame.width - btnW * number - (number - 1) * Kpadding) / 2
        for var index = 0; index < pageNumber; index++ {
            let btn = BaseButton(frame: CGRect(x: btnX + (btnW + Kpadding) * CGFloat(index), y: btnY, width: itemSize.width, height: itemSize.height))
            btn.setBackgroundImage(UIImage(named: normalImageName), forState: .Normal)
            btn.setBackgroundImage(UIImage(named: selectedImageName), forState: .Selected)
            self.addSubview(btn)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

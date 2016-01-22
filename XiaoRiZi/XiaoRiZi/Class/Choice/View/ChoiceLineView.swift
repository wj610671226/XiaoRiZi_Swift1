//
//  ChoiceLineView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/16.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ChoiceLineView: UIView {

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        
        // 获取上下文
        let context = UIGraphicsGetCurrentContext()
        
        // 画横线
        CGContextMoveToPoint(context, 0, bounds.height / 2)
        CGContextAddLineToPoint(context, bounds.width, bounds.height / 2)
        
        // 画竖线
        CGContextMoveToPoint(context, bounds.width / 2, 0)
        CGContextAddLineToPoint(context, bounds.width / 2, bounds.height)
        
        // 设置宽度
        CGContextSetLineWidth(context, 1)
        // 设置颜色
        UIColor.whiteColor().set()
        
        CGContextStrokePath(context)
        
        
    }

}

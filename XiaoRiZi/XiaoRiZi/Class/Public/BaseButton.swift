//
//  BaseButton.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/27.
//  Copyright © 2016年 ty. All rights reserved.
//  去除高亮效果的按钮

import UIKit

class BaseButton: UIButton {
    
    // 去除高亮效果
    override var highlighted: Bool {
        didSet {
            super.highlighted = false
        }
    }
}

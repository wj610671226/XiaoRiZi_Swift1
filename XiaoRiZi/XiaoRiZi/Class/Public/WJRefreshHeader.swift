//
//  WJRefreshHeader.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/31.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit
import MJRefresh

class WJRefreshHeader: MJRefreshGifHeader {
    /**
     初始化
     */
    override func prepare() {
        super.prepare()
        // 隐藏状态
        stateLabel?.hidden = true
        // 隐藏上一次刷新的时间
        lastUpdatedTimeLabel?.hidden = true
        
        // 设置 松开就可以进行刷新的状态 图片
        var startImages: [UIImage] = Array()
        startImages.append(UIImage(named: "wnx00")!)
        setImages(startImages, forState: MJRefreshStatePulling)
        
        // 设置 正在刷新中的状态 图片
        var beginImages: [UIImage] = Array()
        for index in 0...92 {
            let nameString = String(format: "wnx%02d", index)
            let image = UIImage(named: nameString)
            beginImages.append(image!)
        }
//        setImages(beginImages, forState: MJRefreshStateRefreshing)
        setImages(beginImages, duration: 4, forState: MJRefreshStateRefreshing)
    }
}

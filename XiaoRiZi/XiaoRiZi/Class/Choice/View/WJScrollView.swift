//
//  WJScrollView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/26.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class WJScrollView: UIView {

    /// 滚动视图
    private var priScrollView: UIScrollView?
    
    /// 存储图片名的数组
    var imageNames: [String]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加scrollView
        addScrollView()
        
        // 添加图片
        addImageView()
        
        // 添加pageController
    }

    // MARK: 添加scrollView
    private func addScrollView() {
        let scrollViewH: CGFloat = bounds.height - 20
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: scrollViewH))
        scrollView.contentSize = CGSize(width: KmainScreenW, height: scrollViewH)
        self.addSubview(scrollView)
        priScrollView = scrollView
    }
    
    // MARK: 添加图片
    private func addImageView() {
        if imageNames?.count == 0 {
            return
        }
        
        for var index = 0; index < imageNames!.count; index++  {
            let imageView = UIImageView(frame: CGRect(x: CGFloat(index) * KmainScreenW, y: 0, width: KmainScreenW, height: priScrollView!.bounds.height))
            imageView.sd_setImageWithURL(NSURL(string: imageNames![0]))
            priScrollView?.addSubview(imageView)
        }
    }
    
    // MARK: 添加page
    private func addPageController() {
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

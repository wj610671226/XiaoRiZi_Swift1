//
//  WJScrollView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/26.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit
@objc protocol WJScorllViewDelegate : class{
    /**
     点击滚动的图片（按钮）
     
     - parameter btnTag: 按钮的tag值
     */
   optional func processScorllViewButton(btnTag: Int)
}

class WJScrollView: UIView, UIScrollViewDelegate {

    /// 滚动视图
    private var priScrollView: UIScrollView?
    
    /// 点击图片的代理
    weak var delegate: WJScorllViewDelegate?
    
    /// pageControl
    weak var pageControl: WJPageControl?
    
    /// 存储图片名的数组
    var imageNames: [String]? {
        didSet {
            // 添加图片
            addButton()
            
            // 添加pageControl
            addPageController()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 添加scrollView
        addScrollView()
    }

    // MARK: 添加scrollView
    private func addScrollView() {
        let scrollViewH: CGFloat = bounds.height - 20
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: scrollViewH))
        scrollView.bounces = false
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        self.addSubview(scrollView)
        priScrollView = scrollView
    }
    
    // MARK: 添加图片
    private func addButton() {
        if imageNames?.count == 0 || imageNames == nil {
            return
        }
        
        for var index = 0; index < imageNames!.count; index++  {
            let btn = BaseButton(frame: CGRect(x: CGFloat(index) * KmainScreenW, y: 0, width: KmainScreenW, height: priScrollView!.bounds.height))
            btn.downLoadBackgroundImage(imageNames![index], state: .Normal)
            btn.addTarget(self, action: "processBtn:", forControlEvents: .TouchDown)
            btn.tag = index
            priScrollView?.addSubview(btn)
        }
        
        // 设置滚动视图的大小
        priScrollView?.contentSize = CGSizeMake(KmainScreenW * CGFloat(imageNames!.count), priScrollView!.bounds.height)
    }
    
    // MARK: 添加pageControlller
    private func addPageController() {
        let pageControlH = self.bounds.height - priScrollView!.bounds.height
        let pageControlY = CGRectGetMaxY(priScrollView!.frame)
        let pageControl = WJPageControl(frame: CGRect(x: 0, y: 0, width: 70, height: pageControlH), itemSize: CGSizeMake(18, 4), pageNumber: imageNames!.count, normalImageName: "slide_1.png", selectedImageName: "slide_2.png")
        pageControl.center = CGPoint(x: KmainScreenW / 2, y: pageControlY + pageControlH / 2)
        pageControl.currentPage = 0
        self.pageControl = pageControl
        self.addSubview(pageControl)
    }
    
    // MARK: scrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // 取出水平方向上滚动的距离
        let offsetX: CGFloat = scrollView.contentOffset.x
        
        // 求出页码
        let pageDouble: CGFloat = offsetX / KmainScreenW
        let pageInt: Int = Int(pageDouble + 0.5)
        pageControl!.currentPage = pageInt
    }
    
    // MARK: processBtn
    func processBtn(sender: UIButton) {
        print("processBtn = \(sender)")
        delegate?.processScorllViewButton!(sender.tag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

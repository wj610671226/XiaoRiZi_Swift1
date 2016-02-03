//
//  ClearColorNavcController.swift
//  XiaoRiZi
//
//  Created by ty on 16/2/2.
//  Copyright © 2016年 ty. All rights reserved.
//  具有透明导航栏和顶部图片的控制器

import UIKit

class ClearColorNavcController: UIViewController {

    /// 顶部图片的高
    private var topImageH: CGFloat = 230
    
    /// 顶部的图片 给子类设置图片
    var topImageView: UIImageView?
    
    /// scollView 便于子类操作
    var clearScrollView: UIScrollView?
    
    /// 自定义导航栏
    private weak var oldCustomNavc: CustomNavc?
    private weak var newCustomNavc: CustomNavc?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化界面
        initClearColorInterface()
    }

    // MARK: 初始化界面
    private func initClearColorInterface() {
        // 添加滚动视图
        let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KmainScreenH))
        scrollView.contentInset = UIEdgeInsetsMake(topImageH, 0, 0, 0)
        scrollView.delegate = self
        scrollView.showsVerticalScrollIndicator = false
        scrollView.contentSize = CGSizeMake(KmainScreenW, KmainScreenH * 5)
        view.addSubview(scrollView)
        clearScrollView = scrollView
        
        // 添加顶部的imageView
        let topImage = UIImageView(frame: CGRect(x: 0, y: -topImageH, width: KmainScreenW, height: topImageH))
        topImage.contentMode = .ScaleToFill
        topImage.clipsToBounds = true
        topImageView = topImage
        scrollView.addSubview(topImage)
        
        // 自定义导航栏
        let navc = CustomNavc(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KbackViewH))
        navc.backBtn?.addTarget(self, action: "processBackBtn", forControlEvents: .TouchDown)
        view.addSubview(navc)
        oldCustomNavc = navc
        
        let custom = CustomNavc(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KbackViewH))
        custom.alpha = 0
        custom.backBtn?.addTarget(self, action: "processBackBtn", forControlEvents: .TouchDown)
        custom.backgroundColor = UIColor.whiteColor()
        newCustomNavc = custom
        view.addSubview(custom)
        
        // 监听搜藏按钮的 selected 属性
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "processSelectedChange:", name: CollectBtnSelectedChangeName, object: nil)
    }
    
    //MARK: processBackBtn 返回上一个界面
    func processBackBtn() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    //MARK: 收藏按钮的选中状态
    func processSelectedChange(info: NSNotificationCenter) {
        print("info = \(info)")
        let selected: Bool = (info.valueForKey("object") as! Int) == 1
        oldCustomNavc?.collectBtn?.selected = selected
        newCustomNavc?.collectBtn?.selected = selected
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: UIScrollViewDelegate
extension ClearColorNavcController: UIScrollViewDelegate {
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        newCustomNavc?.alpha = (y + KbackViewH) / (topImageH - KbackViewH) + 1.0
        
        if y < -topImageH {
            topImageView?.frame.origin.y = y
            topImageView?.frame.size.height = -y
            topImageView?.frame.size.width = -y - topImageH + KmainScreenW
            topImageView?.frame.origin.x = -(-y - topImageH) / 2
        }
        
        if y >= -KbackViewH {
            oldCustomNavc?.hidden = true
            newCustomNavc?.backBtn?.setImage(UIImage(named: "back_1"), forState: .Normal)
            newCustomNavc?.collectBtn?.setImage(UIImage(named: "collect_1"), forState: .Normal)
            newCustomNavc?.shareBtn?.setImage(UIImage(named: "share_1"), forState: .Normal)
        } else {
            oldCustomNavc?.hidden = false
            newCustomNavc?.backBtn?.setImage(UIImage(named: "back_0"), forState: .Normal)
            newCustomNavc?.collectBtn?.setImage(UIImage(named: "collect_0"), forState: .Normal)
            newCustomNavc?.shareBtn?.setImage(UIImage(named: "share_0"), forState: .Normal)
        }
    }
}
//
//  BaseViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/13.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    /// 导航栏 指定view
    private var backView: UIView!
    
    /// leftItem
    var leftItem: UIButton!
    
    /// rightItem
    var rightItem: UIButton!
    
    /// 标题
    var titleLabel: UILabel!
    
    /// 自定义导航栏的Y 和 H
    private let subViewY: CGFloat = 20
    private let subViewH: CGFloat = 44
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 隐藏导航栏
        navigationController?.navigationBar.hidden = true
        
        // 初始化界面  自定义导航栏
        initUserInterface()
    }

    // MARK: 初始化界面
    private func initUserInterface() {
        
        // 顶部的backView
        backView = UIView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KbackViewH))
        backView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(backView)
        
        // leftItem
        leftItem = BaseBtn(frame: CGRect(x: 0, y: subViewY, width: 80, height: subViewH))
        let title: String = SaveMessageTool.readeCurrentCityMessage(KCityKey)
        leftItem.setTitle(title, forState: .Normal)
        leftItem.setImage(UIImage(named: "home_down"), forState: .Normal)
        leftItem.setTitleColor(UIColor.blackColor(), forState: .Normal)
        leftItem.addTarget(self, action: Selector("processLtfeItem"), forControlEvents: .TouchDown)
        backView.addSubview(leftItem)
        
        // 添加通知监听
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "processCityChange:", name: CityChangeNSNotificationName, object: nil)
        
        // titleLabel
        titleLabel = UILabel(frame: CGRect(x: 0, y: subViewY, width: 60, height: subViewH))
        titleLabel.text = "占位标题标题"
        titleLabel.sizeToFit()
        titleLabel.textAlignment = .Center
        titleLabel.font = UIFont.systemFontOfSize(18)
        titleLabel.center = CGPoint(x: KmainScreenW / 2, y: subViewH / 2 + subViewY)
        backView.addSubview(titleLabel)
        
        // rightLable
        let rightItemW: CGFloat = 50
        let rightItemX: CGFloat = KmainScreenW - rightItemW
        rightItem = UIButton(frame: CGRect(x: rightItemX, y: subViewY, width: rightItemW, height: subViewH))
        rightItem.titleLabel?.font = UIFont.systemFontOfSize(16)
        rightItem.setTitleColor(UIColor.blackColor(), forState: .Normal)
        rightItem.titleLabel?.textAlignment = .Center
        backView.addSubview(rightItem)
    }
    
    // MARK: 点击leftItem
    func processLtfeItem() {
        self.presentViewController(CityViewController(), animated: true, completion: nil)
    }

    func processCityChange(info: NSNotification) {
        print("info = \(info)")
        let title = info.valueForKey("object") as? String
        leftItem.setTitle(title, forState: .Normal)
        // 将城市信息写入沙盒
        SaveMessageTool.saveCurrentCityMessage(title!)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        print("baseViewcontroller 释放")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}



class BaseBtn: UIButton {
    
    private let Ksacle: CGFloat = 0.7
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView?.contentMode = .Left
        titleLabel?.font = UIFont.systemFontOfSize(KItemFont)
    }

//    override func titleRectForContentRect(contentRect: CGRect) -> CGRect {
//        return CGRect(x: 0, y: 0, width: contentRect.width * Ksacle, height: contentRect.height)
//    }
//    
//    override func imageRectForContentRect(contentRect: CGRect) -> CGRect {
//        return CGRect(x: contentRect.width * Ksacle, y: 0, width: contentRect.width * (1 - Ksacle), height: contentRect.height)
//    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel!.sizeToFit()
        titleLabel?.frame = CGRect(x: 10, y: 0, width: titleLabel!.bounds.width, height: bounds.height)
        imageView?.frame = CGRect(x: titleLabel!.bounds.width + 15, y: 0, width: bounds.width - titleLabel!.bounds.width - 10, height: bounds.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
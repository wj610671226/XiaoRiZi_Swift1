//
//  ShopDetailViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/2/1.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit
import WebKit
class ShopDetailViewController: UIViewController, UIScrollViewDelegate , WKNavigationDelegate{

    /// 数据
    var model: ShopsModel?
    
    /// 顶部图片的高
    private let topImageH: CGFloat = 230
    
    /// 顶部的图片
    private var topImageView: UIImageView?
    
    /// 自定义导航栏
    private weak var oldCustomNavc: CustomNavc?
    private weak var newCustomNavc: CustomNavc?
    
    /// 店发现，店详情
    private weak var shopChooseView: ShopChooseView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets = false
        // 初始化界面
        initShopDetailInterface()
    }

    // MARK: 初始化界面
    private func initShopDetailInterface() {
        // 添加滚动视图
        let shopScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KmainScreenH))
        shopScrollView.contentInset = UIEdgeInsetsMake(topImageH, 0, 0, 0)
        shopScrollView.delegate = self
        shopScrollView.showsVerticalScrollIndicator = false
        view.addSubview(shopScrollView)
        
        // 添加顶部的imageView 
        let topImage = UIImageView(frame: CGRect(x: 0, y: -topImageH, width: KmainScreenW, height: topImageH))
        topImage.downLoadImage((model?.img)!)
        topImage.contentMode = .ScaleToFill
        topImage.clipsToBounds = true
        topImageView = topImage
        shopScrollView.addSubview(topImage)
        
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
        
        // 添加店详情View
        let chooseView = ShopChooseView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: 50))
        shopChooseView = chooseView
        
        // 添加webView
        let webViewY: CGFloat = CGRectGetMaxY(chooseView.frame)
        let webViewH: CGFloat = KmainScreenH - webViewY
        let webView = WKWebView(frame: CGRect(x: 0, y: webViewY, width: KmainScreenW, height: 10000))
        let url = NSURL(string: model!.share_url!)
        webView.navigationDelegate = self
        let request = NSURLRequest(URL: url!)
//        webView.loadHTMLString(model!.content!, baseURL: nil)
        webView.loadRequest(request)
        webView.userInteractionEnabled = false
        shopScrollView.addSubview(webView)
        shopScrollView.contentSize = CGSizeMake(KmainScreenW, 10000)
        
        shopScrollView.addSubview(chooseView)
    }
    
    // MARK: UIScrollViewDelegate
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
            
            // 设置 店详情视图的Y值
            shopChooseView?.frame.origin.y = KbackViewH + y
        } else {
            oldCustomNavc?.hidden = false
            newCustomNavc?.backBtn?.setImage(UIImage(named: "back_0"), forState: .Normal)
            newCustomNavc?.collectBtn?.setImage(UIImage(named: "collect_0"), forState: .Normal)
            newCustomNavc?.shareBtn?.setImage(UIImage(named: "share_0"), forState: .Normal)
            
            shopChooseView?.frame.origin.y = 0
        }
    }
    
    // MARK: WKNavigationDelegate
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载 \(webView),navigation = \(navigation)")
    }

    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("结束加载 \(webView),navigation = \(navigation)")
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        print("加载失败 = didFailNavigation")
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print("加载失败 = didFailProvisionalNavigation")
    }
    // MARK: processBackBtn 点击返回
    func processBackBtn() {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

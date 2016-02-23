//
//  WeekDetailViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/2/2.
//  Copyright © 2016年 ty. All rights reserved.
//  这个页面的webView加载的数据应该由 htmlString 来显示的，此处用了shareURL 的地址加载的  效果不好

import UIKit
import WebKit
import SVProgressHUD

class WeekDetailViewController: ClearColorNavcController {

    /// 数据模型
    var model: WeekModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        // 初始化界面
        initClearInterface()
    }

    // MARK: 初始化界面
    private func initClearInterface() {
        // 设置顶部图片
        super.topImageView?.downLoadImage((model?.imgs![0])!)
        
        // 添加webView
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: 0))
        webView.scrollView.scrollEnabled = false
        webView.navigationDelegate = self
        
//        let newString = htmleString.stringByReplacingOccurrencesOfString("<p>", withString: "<p style = 'font-size: 50px;'>")
//        webView.loadHTMLString(newString, baseURL: nil)
        
        let url = NSURL(string: model!.shareURL!)
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        
        super.clearScrollView?.addSubview(webView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.hidden = false
    }
    
    deinit {
        print("WeekDetailViewController  deinit")
    }
}

extension WeekDetailViewController: WKNavigationDelegate {
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
        SVProgressHUD.showWithStatus("加载中...", maskType: SVProgressHUDMaskType.Black)
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("结束加载")
        print(webView.scrollView.contentSize.height)
        weak var weakWebView:WKWebView? = webView
        // 获取webView滚动的高度
        webView.evaluateJavaScript("document.body.offsetHeight") { (obj:AnyObject?, error: NSError?) -> Void in
            print("obj = \(obj), error = \(error)")
            
            if obj != nil {
                let height = obj as! CGFloat
                weakWebView?.frame = CGRect(x: 0, y: 0, width: KmainScreenW, height: height - 120)
                super.clearScrollView?.contentSize = weakWebView!.bounds.size
                
                SVProgressHUD.dismiss()
            }
        }
    }
}
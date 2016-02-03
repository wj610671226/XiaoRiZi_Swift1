//
//  ChoiceWebViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit
import WebKit
import SVProgressHUD

class ChoiceWebViewController: UIViewController,WKNavigationDelegate {

    /// 请求地址
    var url: String?
    
    /// 是否显示收藏按钮
    var isCollection: Bool?
    
    /// 分享的视图
    private weak var shareView: ShareView?
    
    /// 黑色背景
    private weak var backView: BackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        let webView = WKWebView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KmainScreenH))
        view.addSubview(webView)
        webView.navigationDelegate = self;
        webView.backgroundColor = UIColor.whiteColor()
        let request = NSURLRequest(URL: NSURL(string: url!)!)
        webView.loadRequest(request)
        
        let shareItem = UIBarButtonItem(normalImageName: "share_1", selectedImageName: "", target: self, action: "shareMessage")
        if isCollection == true {
            let collectionItem = UIBarButtonItem(normalImageName: "collect_1", selectedImageName: "collect_2", target: self, action: "collectionMessage:")
            navigationItem.rightBarButtonItems = [shareItem, collectionItem]
        } else {
            navigationItem.rightBarButtonItem = shareItem
        }
    }

    // MARK: shareMessage 分享
    func shareMessage() {
        print("分享")
        
        self.addBlackBackGroundViewAndShareView(UIScreen.mainScreen().bounds, target: self, action: "processTopBackView")
        
//        if self.backView == nil {
//            let backView = BackView(frame: UIScreen.mainScreen().bounds, target: self, action: "processTopBackView")
//            view.addSubview(backView)
//            self.backView = backView
//        }
//        
//        if self.shareView == nil {
//            let shareView = ShareView.shareViewWithXib()
//            shareView.frame.size.width = KmainScreenW
//            shareView.frame.origin.y = KmainScreenH
//            self.shareView = shareView
//
//            shareView.hiddenShareView = { () -> Void in
//                print("hiddenShareView")
//                self.backView?.canalAlpha()
//            }
//        }
//        view.addSubview(self.shareView!)
//        self.shareView?.showShareView()
    }
    
    //  MARK: collectionMessage 搜藏
    func collectionMessage(sender: UIButton) {
        sender.selected = !sender.selected
        print("收藏")
    }
    
    // MARK: backView 的点击手势
    func processTopBackView() {
        // 改变 backView
        self.backView?.canalAlpha()
        // 隐藏 shareView
        self.shareView?.disMissView()
    }
    
    // MARK: WKNavigationDelegate
    func webView(webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("开始加载")
        SVProgressHUD.setDefaultMaskType(.Black)
        SVProgressHUD.show()
    }
    
    func webView(webView: WKWebView, didFailNavigation navigation: WKNavigation!, withError error: NSError) {
        print("faile")
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        print("didFinishNavigation")
        SVProgressHUD.dismiss()
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print("didFailProvisionalNavigation")
    }
    
    func webView(webView: WKWebView, didCommitNavigation navigation: WKNavigation!) {
        print("didCommitNavigation")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("ChoiceWebViewController 销毁")
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

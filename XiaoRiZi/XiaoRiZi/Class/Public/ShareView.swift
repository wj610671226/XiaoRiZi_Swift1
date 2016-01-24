//
//  ShareView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/21.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit


typealias HiddenShareView = () -> Void

class ShareView: UIView {
    
    /// 动画时间
    private var KanimtationTime: NSTimeInterval = 0.5
    
    var hiddenShareView: HiddenShareView?
    
    // MARK: dismiss ShareView
    @IBAction func disMissShareView(sender: AnyObject) {
        disMissView()
        hiddenShareView!()
    }

    // MARK: 分享
    @IBAction func processShareBtn(sender: AnyObject) {
        print("还没有实现")
    }
    
    static func shareViewWithXib() -> ShareView {
        return (NSBundle.mainBundle().loadNibNamed("ShareView", owner: nil, options: nil).first as? ShareView)!
    }
    
    // MARK: 显示ShareView
    func showShareView() {
        UIView.animateWithDuration(KanimtationTime) { () -> Void in
            self.transform = CGAffineTransformMakeTranslation(0, -KshareViewH)
        }
    }
    
    // MARK: 隐藏ShareView
    func disMissView() {
        UIView.animateWithDuration(KanimtationTime, animations: { () -> Void in
                self.transform = CGAffineTransformIdentity
            }) { (_) -> Void in
                self.removeFromSuperview()
        }
    }
    
    deinit {
        print("shareView 销毁")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

//
//  BackView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/21.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class BackView: UIView {

    /// 默认的 alpha 值
    private let Kalpha: CGFloat = 0.5
    
    convenience init(frame: CGRect, target: AnyObject, action: Selector) {
        self.init(frame: frame)
        backgroundColor = UIColor.blackColor()
        alpha = Kalpha
        addGestureRecognizer(UITapGestureRecognizer(target: target, action: action))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /**
     恢复默认的alpha的值
     */
    func canalAlpha() {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.alpha = 0
            }) { (_) -> Void in
                self.alpha = self.Kalpha
                self.removeFromSuperview()
        }
    }
    
    deinit {
        print("BackView 销毁")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

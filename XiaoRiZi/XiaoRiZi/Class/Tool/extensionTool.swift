//
//  extensionTool.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/20.
//  Copyright © 2016年 ty. All rights reserved.
//

import Foundation

// MARK: String
extension String {
    
    /**
     获取字符串的自适应大小
     
     - parameter fontSize:   字体的大小
     - parameter maxSize:    最大的范围
     - parameter stringName: 字符串
     
     - returns: 大小
     */
    static func stringSizeToFitCustom(fontSize: CGFloat,maxSize: CGSize, stringName: NSString) -> CGSize {
        let size = stringName.boundingRectWithSize(maxSize, options:[NSStringDrawingOptions.UsesFontLeading, NSStringDrawingOptions.UsesLineFragmentOrigin] , attributes: [NSFontAttributeName: UIFont.systemFontOfSize(fontSize)], context: nil).size
        return size
    }
}


// MARK: UIImage
extension UIImage {
    
    /**
     获取一张拉伸后的图片
     
     - parameter imageName: 图片名字
     
     - returns: 图片
     */
    
    static func imageStretch(imageName: String) -> UIImage {
        let image = UIImage(named: imageName)
        let w: CGFloat = image!.size.width * 0.5
        let h: CGFloat = image!.size.height * 0.5
        return image!.resizableImageWithCapInsets(UIEdgeInsets(top: h, left: w, bottom: h, right: w))
//        return image?.stretchableImageWithLeftCapWidth(image?.size.width * 0.5, topCapHeight: image?.size.width * 0.5)
    }
}

// MARK: UIBarButtonItem
extension UIBarButtonItem {
    convenience init(normalImageName: String, selectedImageName: String, target: AnyObject, action: Selector) {
        let btn = UIButton(type: .Custom)
        btn.setImage(UIImage(named: normalImageName), forState: .Normal)
        btn.setImage(UIImage(named: selectedImageName), forState: .Selected)
        btn.contentMode = .Center
        btn.frame = CGRect(x: 0, y: 0, width: 60, height: 44)
        btn.addTarget(target, action: action, forControlEvents: .TouchDown)
        self.init(customView: btn)
    }
}

// MARK: UIImageView
extension UIImageView {
    /**
     给imageView设置网络图片
     
     - parameter imageName:            图片名字
     - parameter placeholderImageName: 占位图片
     */
    func downLoadImage(imageName: String, placeholderImageName: String) {
        self.sd_setImageWithURL(NSURL(string: imageName), placeholderImage: UIImage(named:placeholderImageName))
    }
    
    /**
     给imageView设置网络图片
     
     - parameter imageName:            图片名字
     */
    func downLoadImage(imageName: String) {
//        self.downLoadImage(imageName, placeholderImageName: "")
        self.sd_setImageWithURL(NSURL(string: imageName))
    }
}

// MARK: UIButton
extension UIButton {
    /**
     给按钮设置网络背景图片
     
     - parameter imageName:            图片名
     - parameter state:                状态
     - parameter placeholderImageName: 占位图片名
     */
    func downLoadBackgroundImage(imageName: String, state: UIControlState, placeholderImageName: String) {
        self.sd_setBackgroundImageWithURL(NSURL(string: imageName), forState: state, placeholderImage: UIImage(named: placeholderImageName))
    }
    
    /**
     给按钮设置网络背景图片
     
     - parameter imageName: 图片名
     - parameter state:     状态
     */
    func downLoadBackgroundImage(imageName: String, state: UIControlState) {
        self.sd_setBackgroundImageWithURL(NSURL(string: imageName), forState: state
        )
    }
    
    /**
     给按钮设置网络图片
     
     - parameter imageName:            图片名
     - parameter state:                状态
     - parameter placeholderImageName: 占位图片名
     */
    func downLoadImage(imageName: String, state: UIControlState, placeholderImageName: String) {
        self.sd_setBackgroundImageWithURL(NSURL(string: imageName), forState: state, placeholderImage: UIImage(named: placeholderImageName))
    }
    
    /**
     给按钮设置网络图片
     
     - parameter imageName: 图片名
     - parameter state:     状态
     */
    func downLoadImage(imageName: String, state: UIControlState) {
        self.sd_setImageWithURL(NSURL(string: imageName), forState: state)
    }
}

extension UIViewController {
    
    func addBlackBackGroundViewAndShareView(blackViewFrame: CGRect, target: AnyObject, action: Selector, blackBackView: BackView, shareView: ShareView) {
        // 黑色背景
        let backView = BackView(frame: blackViewFrame, target: target, action: action)
        view.addSubview(backView)
//        blackBackView = backView
        
        // 分享视图
        let shareView = ShareView.shareViewWithXib()
        shareView.frame.size.width = KmainScreenW
        shareView.frame.origin.y = KmainScreenH
        
        // 隐藏黑色背景的闭包
        shareView.hiddenShareView = { () -> Void in
            backView.canalAlpha()
        }
        
        view.addSubview(shareView)
        // 展示分型视图的动画
        shareView.showShareView()
    }
}
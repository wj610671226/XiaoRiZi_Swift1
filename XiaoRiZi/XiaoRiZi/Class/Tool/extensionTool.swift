//
//  extensionTool.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/20.
//  Copyright © 2016年 ty. All rights reserved.
//

import Foundation
import UIKit
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
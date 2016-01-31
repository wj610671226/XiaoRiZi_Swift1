//
//  SaveMessageTool.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class SaveMessageTool: NSObject {
    
    private static let defaults = NSUserDefaults.standardUserDefaults()
    
    /**
     保存信息
     
     - parameter key:    key
     - parameter object: value
     */
    static func saveMessage(key: String,object: AnyObject) {
        defaults.setObject(object, forKey: key)
        defaults.synchronize()
    }
    
    /**
     读取信息
     
     - parameter key: key
     
     - returns: value
     */
    static func readeMessage(key: String) -> AnyObject? {
        return defaults.objectForKey(key)
    }
}

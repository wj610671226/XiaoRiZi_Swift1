//
//  SaveMessageTool.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class SaveMessageTool: NSObject {
    
    /**
     保存当前的城市
     
     - parameter cityName: 城市名字
     */
    static func saveCurrentCityMessage(cityName: String) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(cityName, forKey: KCityKey)
        defaults.synchronize()
    }
    
    /**
     读取当前城市
     
     - parameter key: key
     
     - returns: 城市名字
     */
    static func readeCurrentCityMessage(key: String) -> String{
        return (NSUserDefaults.standardUserDefaults().objectForKey(key) as? String) ?? "北京"
    }
}

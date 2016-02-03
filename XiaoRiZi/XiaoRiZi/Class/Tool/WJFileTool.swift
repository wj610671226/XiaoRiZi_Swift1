//
//  WJFileTool.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/31.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit
import SVProgressHUD
class WJFileTool: NSObject {
    
    private static let fileManager = NSFileManager.defaultManager()
    /**
     计算单个文件的大小
     */
    static func getSingleCacheFileSize(filePath: String) -> Double{
        // 查找文件是否存在
        if fileManager.fileExistsAtPath(filePath) {
            // 计算文件大小
            do {
                let fileSize = try fileManager.attributesOfItemAtPath(filePath)
                let size = fileSize[NSFileSize] as! Double
                return  size / 1024.0 / 1024.0
            } catch _{
            }
        }
        return 0.0
    }
    
    /**
     计算整个文件件的大小
     
     - parameter filePath: 文件夹路径
     
     - returns: 文件大小
     */
    static func getFolderCacheFileSize(filePath: String) -> Double {
        var totleSize: Double = 0.0
        // 判断文件是否存在
        if fileManager.fileExistsAtPath(filePath) {
            // 获取文件夹里面的文件名
            let filePathArray = fileManager.subpathsAtPath(filePath)
            for obj in filePathArray! {
                let pathString = filePath as NSString
                totleSize += self.getSingleCacheFileSize(pathString.stringByAppendingPathComponent(obj))
            }
            return totleSize
        }
        return 0.0
    }
    
    /**
     清理缓存文件
     
     - parameter filePath: 缓存路径
     */
    static func clearCacheFile(filePath: String, clearSuccess:() -> Void) {
        if fileManager.fileExistsAtPath(filePath) {
            // 开始清理
            SVProgressHUD.showWithStatus("正在清理", maskType: SVProgressHUDMaskType.Black)
            let queue = dispatch_queue_create("clearQueue", nil)
            dispatch_async(queue, { () -> Void in
                let filePathArray = self.fileManager.subpathsAtPath(filePath)
                for obj in filePathArray! {
                    let pathString = filePath as NSString
                    let path = pathString.stringByAppendingPathComponent(obj)
                    do {
                        try self.fileManager.removeItemAtPath(path)
                    } catch _{
                    }
                }
                
                // 线程睡一秒   让SVProgressHUD 停留的时间长一些，体验更好
                NSThread.sleepForTimeInterval(1)
                
                // 结束清理
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    SVProgressHUD.dismiss()
                    clearSuccess()
                })
            })
        }
    }
}

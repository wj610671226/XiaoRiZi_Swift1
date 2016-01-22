//
//  GetNetMessageTool.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/14.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class GetNetMessageTool: NSObject {

    /**
     获取本地数据
     */
    static func getLocalMessageWithJsonData(jsonName: String, successBlock: (responseObject: AnyObject) -> Void, errorBlock:(errorMessage:ErrorType) -> Void) {
        let path = NSBundle.mainBundle().URLForResource(jsonName, withExtension: nil)
        let data = NSData(contentsOfURL: path!)
        do {
            let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            successBlock(responseObject: result)
        } catch {
            errorBlock(errorMessage: error)
        }
    }
    
    func ceshi(param: String, modelTye:AnyClass, successBlock: (responseObject: AnyObject) -> Void, errorBlock:(errorMessage:ErrorType) -> Void) {
        let path = NSBundle.mainBundle().URLForResource(param, withExtension: nil)
        let data = NSData(contentsOfURL: path!)
        do {
            let result = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
            let data1 = modelTye.mj_objectArrayWithKeyValuesArray(result)
            successBlock(responseObject: data1)
        } catch {
            errorBlock(errorMessage: error)
        }
    }
    
    
}

//
//  ExploreModel.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/23.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

/// 探店的模型
class ExploreModel: NSObject {
     /// 关键字
    var day_word: String?
     /// thems
    var themes: [ThemesModel]?
     /// 日期
    var date: NSString? {
        didSet {
            // 日
            let day = date?.substringFromIndex(date!.length - 2)
            self.day = day
            // 月
            let month = (date?.substringWithRange(NSMakeRange(5, 2)))! as String
            switch month {
            case "01":
                self.month = "Jan."
            case "02":
                self.month = "Feb."
            case "03":
                self.month = "Mar."
            case "04":
                self.month = "Apr."
            case "05":
                self.month = "May."
            case "06":
                self.month = "Jun."
            case "07":
                self.month = "Jul."
            case "08":
                self.month = "Aug."
            case "09":
                self.month = "Sep."
            case "10":
                self.month = "Oct."
            case "11":
                self.month = "Nov."
            case "12":
                self.month = "Dec."
            default:
                self.month = "error"
            }
        }
    }
     /// 店铺信息
    var shops: [ShopsModel]?
    /// 日
    var day: String?
    /// 月
    var month: String?
}

/// shops 模型
class ShopsModel: NSObject {
    /// 电话号码
    var phone: String?
    /// 网页地址
    var share_url: String?
    /// 店铺地址
    var address: String?
    /// 姓名
    var name: String?
    /// 标题
    var title: String?
    /// 图片
    var img: String?
}

/// themes 模型
class ThemesModel: ChoiceListModel {
    
}
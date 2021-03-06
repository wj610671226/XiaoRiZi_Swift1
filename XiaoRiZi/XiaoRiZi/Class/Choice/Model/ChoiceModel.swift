//
//  ChoiceModel.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/15.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

/// 精选主页model
class ChoiceListModel: BaseModel {
    
    /// id
    var uid: String?
    
    /// 类型
    var theme_type: String?

    /// 内容详细的url地址
    var theme_url: String?
}


/// 精选  每天 model
class ChoiceDetailModel : NSObject {
    /// 日期
    var date: String?
    
    // article
    var article: [ArticleModel]?
}

class ArticleModel: BaseModel {

    /// url地址
    var url: String?
}

/// 匠人.志  model
class CiaftsmenModel: BaseModel {
    /// 名字
    var name: String?
    /// 头像
    var head_photo: String?
    /// 工作室
    var workroom: String?
    /// url地址
    var url: String?
}

/// 周末，好玩的 model
class WeekModel: BaseModel {
    /// 图片数组
    var imgs: [String]?
    
    /// 手机端地址
    var mobileURL: String?
    
    /// 店铺地址
    var address: String?
    
    /// 分享地址
    var shareURL: String?
}

class WeekHeadModel: NSObject {
     /// 图片地址
    var adurl: String?
     /// 详细地址
    var mobileURL: String?
}
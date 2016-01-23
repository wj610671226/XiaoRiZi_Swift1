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
    var themes: [themesModel]?
     /// 日期
    var date: String?
     /// 店铺信息
    var shops: [shopsModel]?
}

/// shops 模型
class shopsModel: NSObject {
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
}

/// themes 模型
class themesModel: ChoiceListModel {
    
}
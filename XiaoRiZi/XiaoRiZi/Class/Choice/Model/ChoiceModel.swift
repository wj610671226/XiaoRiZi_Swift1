//
//  ChoiceModel.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/15.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

/// 精选主页model
class ChoiceListModel: NSObject {
    
 /// id
    var uid: String?
    
 /// tag
    var tag: String?
    
 /// 类型
    var theme_type: String?
    
 /// 标题
    var title: String?
    
 /// 图片
    var img: String?
    
    /// 内容详细的url地址
    var theme_url: String?
}

/// 精选详细页model
class ChoiceDetailModel : NSObject {
    /// 日期
    var date: String?
    
    /// article
    var article: NSArray? {
        didSet {
            let data: NSMutableArray = NSMutableArray()
            for obj in article! {
                let model = ArticleModel()
                model.img = obj["img"] as? String
                model.title = obj["title"] as? String
                model.url = obj["url"] as? String
                model.tag = obj["tag"] as? String
                data.addObject(model)
            }
            article = data
        }
    }
}

class ArticleModel: NSObject {
    /// 图片
    var img: String?
    
    /// 标题
    var title: String?
    
    /// url地址
    var url: String?
    
     /// tag
    var tag: String?
}
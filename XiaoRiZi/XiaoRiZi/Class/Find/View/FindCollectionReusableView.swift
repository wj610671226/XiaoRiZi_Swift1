//
//  FindCollectionReusableView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/23.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class FindCollectionReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 标题
        let titleLabel = UILabel()
        titleLabel.text = "大家都在搜"
        titleLabel.font = UIFont.systemFontOfSize(18)
        titleLabel.sizeToFit()
        titleLabel.frame.origin.x = Kpadding
        titleLabel.frame.origin.y = Kpadding
        self.addSubview(titleLabel)
        // 按钮
        
        // title
//        let  = UILabel()
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

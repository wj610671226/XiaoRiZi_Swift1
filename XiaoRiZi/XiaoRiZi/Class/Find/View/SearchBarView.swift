//
//  SearchBarView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/20.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class SearchBarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 背景
        let backImage = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backImage.userInteractionEnabled = true
        backImage.image = UIImage(named: "searchbox")
        self.addSubview(backImage)
        
        // 输入框
        let padding: CGFloat = 5
        let searchField = UITextField(frame: CGRect(x: padding, y: 0, width: frame.size.width - 2 * padding, height: frame.size.height))
        searchField.placeholder = "店名，地址"
        searchField.clearButtonMode = .WhileEditing
        backImage.addSubview(searchField)
        
        let leftViewH = frame.size.height
        let leftView = UIImageView(frame: CGRect(x: 0, y: 0, width: leftViewH, height: leftViewH))
        leftView.image = UIImage(named: "search_2")
        searchField.leftViewMode = .Always
        searchField.leftView = leftView
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

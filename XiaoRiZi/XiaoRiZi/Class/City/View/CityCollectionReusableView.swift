//
//  CityCollectionReusableView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/17.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

// headerView
class CityHeaderCollectionReusableView: UICollectionReusableView {
    
    var headerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        headerLabel.textAlignment = .Center
        headerLabel.font = UIFont.systemFontOfSize(20)
        self.addSubview(headerLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        headerLabel.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// footerView
class CityFooterCollectionReusableView: UICollectionReusableView {
    var footerLabel = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        footerLabel.textAlignment = .Center
        footerLabel.font = UIFont.systemFontOfSize(15)
        footerLabel.text = "更多城市，敬请期待"
        self.addSubview(footerLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        footerLabel.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
//
//  FindCollectionViewCell.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/22.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class FindCollectionViewCell: UICollectionViewCell {

    /// 图片
    @IBOutlet weak var img: UIImageView!
    
    /// 标题
    @IBOutlet weak var titleLabel: UILabel!
    
    var model: FindModel? {
        didSet {
            // 图片
            img.downLoadImage((model?.img)!)
            
            // 标题
            titleLabel.text = model?.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}

//
//  ChoiceDetailTopView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ChoiceDetailTopView: UIButton {

    /// 标题
    private weak var titleLeb: UILabel?
    
    /// 时间
    weak var timeLabel: UILabel?
    
    /// 图片
    private weak var img: UIImageView?
    
    var model: ArticleModel? {
        didSet {
            img?.sd_setImageWithURL(NSURL(string: (model?.img)!))
            titleLeb?.text = model?.title
        }
    }
    
    // 比例
    private let Kscale: CGFloat = 0.4
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 时间
        let time = UILabel()
        time.textAlignment = .Center
        time.textColor = UIColor.lightGrayColor()
        time.font = UIFont.systemFontOfSize(20)
        self.addSubview(time)
        timeLabel = time
        
        // 图片
        let imageView = UIImageView()
        self.addSubview(imageView)
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        img = imageView
        
        // 标题
        let title = UILabel()
        title.textColor = UIColor.whiteColor()
        title.font = UIFont.systemFontOfSize(22)
        imageView.addSubview(title)
        titleLeb = title
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        // 调整子视图的位置
        let tiemLabelH: CGFloat = 50
        timeLabel!.frame = CGRect(x: 0, y: 0, width: bounds.width, height: tiemLabelH)
        
        let imgH: CGFloat = 240
        img!.frame = CGRect(x: Kpadding, y: tiemLabelH, width: bounds.width - Kpadding * 2, height: imgH)
        
        let titleH: CGFloat = 50
        let titleY: CGFloat = bounds.height - titleH
        let titleX: CGFloat = Kpadding
        let titleW = bounds.width - 2 * titleX
        titleLeb!.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}

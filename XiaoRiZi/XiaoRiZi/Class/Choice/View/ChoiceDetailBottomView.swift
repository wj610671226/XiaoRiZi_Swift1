//
//  ChoiceDetailBottomView.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ChoiceDetailBottomView: UIButton {

    /// 标题
    private var titleLbl: UILabel?
    /// tag
    private var tagLbl: UILabel?
    /// 图片
    private var img: UIImageView?
    
    private let titleFont: CGFloat = 16
    /// 模型
    var model: ArticleModel? {
        didSet {
            titleLbl?.text = model?.title
            tagLbl?.text = "文." + (model?.tag)!
            img?.downLoadImage((model?.img)!)
            
            // 调整子视图的位置
            let padding: CGFloat = Kpadding / 2
            let imgW: CGFloat = bounds.height - padding
            let imgX: CGFloat = bounds.width - imgW - Kpadding
            let imgY: CGFloat = padding
            img!.frame = CGRect(x: imgX, y: imgY, width: imgW, height: imgW)
            
            let titleW = bounds.width - imgW - Kpadding * 2 - padding
            let titleH: CGFloat = String.stringSizeToFitCustom(titleFont, maxSize: CGSizeMake(titleW, CGFloat(MAXFLOAT)), stringName: (model?.title)!).height
            titleLbl!.frame = CGRect(x: Kpadding, y: imgY, width: titleW, height: titleH)
            
            let tagW = titleW
            let tagH: CGFloat = bounds.height - titleH
            let tagY: CGFloat = CGRectGetMaxY(titleLbl!.frame)
            tagLbl!.frame = CGRect(x: Kpadding, y: tagY, width: tagW, height: tagH)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 标题
        titleLbl = UILabel()
        titleLbl!.numberOfLines = 0
        titleLbl!.font = UIFont.systemFontOfSize(titleFont)
        self.addSubview(titleLbl!)
//        titleLbl?.backgroundColor = UIColor.greenColor()
        // tag
        tagLbl = UILabel()
        tagLbl!.textColor = UIColor.grayColor()
        tagLbl!.font = UIFont.systemFontOfSize(14)
        self.addSubview(tagLbl!)
//        tagLbl?.backgroundColor = UIColor.redColor()
        // 图片
        img = UIImageView()
        img!.layer.cornerRadius = 5
        img!.clipsToBounds = true
        self.addSubview(img!)
    }

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        // 调整子视图的位置
//        let padding: CGFloat = Kpadding / 2
//        let imgW: CGFloat = bounds.height - padding
//        let imgX: CGFloat = bounds.width - imgW - Kpadding
//        let imgY: CGFloat = padding
//        img!.frame = CGRect(x: imgX, y: imgY, width: imgW, height: imgW)
//        
//        
////        let titleW = tagW
////        let titleH: CGFloat = bounds.height - tagH
////        titleLbl!.frame = CGRect(x: Kpadding, y: imgY, width: titleW, height: titleH)
//        
//        let tagW = bounds.width - imgW - Kpadding * 2 - padding
//        let tagH: CGFloat = 30.0
//        let tagY: CGFloat = bounds.height - tagH
//        tagLbl!.frame = CGRect(x: Kpadding, y: tagY, width: tagW, height: tagH)
//        
//        
//    }
    
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

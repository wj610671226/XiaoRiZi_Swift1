//
//  MineViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/13.
//  Copyright © 2016年 ty. All rights reserved.
//  我的页面

import UIKit

class MineViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化mineNavc
        initMineNavc()
    }
    
    private func initMineNavc() {
        titleLabel.text = "我的"
        
        leftItem.hidden = true
        
        // 设置按钮
        rightItem.setImage(UIImage(named: "settinghhhh"), forState: .Normal)
        rightItem.addTarget(self, action: "processSettingItem", forControlEvents: .TouchDown)
    }

    // MARK: 点击设置按钮
    func processSettingItem() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

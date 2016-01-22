//
//  ExploreViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/13.
//  Copyright © 2016年 ty. All rights reserved.
//  探店页面

import UIKit

class ExploreViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化导航栏
        initExploreNavc()
    }

    // MARK: 初始化导航栏
    private func initExploreNavc() {
        // 设置标题
        titleLabel.text = "探店"
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

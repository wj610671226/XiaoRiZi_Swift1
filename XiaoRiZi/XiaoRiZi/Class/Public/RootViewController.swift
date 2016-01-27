//
//  RootViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/13.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 添加所有的子控制器
        addAllChildController()
    }

    // MARK:  添加所有的子控制器
    private func addAllChildController() {
        // 设置tabBar 主题色
        tabBar.tintColor = UIColor.blackColor()
        tabBar.barTintColor = UIColor.lightGrayColor()
        
        // 精选
        addOneChildControlller(ChoiceViewController(), title: "精选", normalImageName: "broadwood_1", selectedImage: "broadwood_2")
        
        // 探店
        addOneChildControlller(ExploreViewController(), title: "探店", normalImageName: "recommendation_1", selectedImage: "recommendation_2")
        
        // 发现
        addOneChildControlller(FindViewController(), title: "发现", normalImageName: "classification_1", selectedImage: "classification_2")
        
        // 我的
        let mineVC = UIStoryboard(name: "MineViewController", bundle: nil).instantiateViewControllerWithIdentifier("MineViewController") as! UITableViewController
        addOneChildControlller(mineVC, title: "我的", normalImageName: "my_1", selectedImage: "my_2")
    }
    
    // MARK: 添加一个控制器
    private func addOneChildControlller(vc: UIViewController, title: String, normalImageName: String, selectedImage: String) {
        
        let item = UITabBarItem(title: title, image: UIImage(named: normalImageName)?.imageWithRenderingMode(.AlwaysOriginal), selectedImage: UIImage(named: selectedImage)?.imageWithRenderingMode(.AlwaysOriginal))
        vc.tabBarItem = item
        vc.title = title
        let navc = BaseNavcViewController(rootViewController: vc)
        addChildViewController(navc)
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

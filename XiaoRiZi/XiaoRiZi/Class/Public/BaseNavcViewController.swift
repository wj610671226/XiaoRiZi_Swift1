//
//  BaseNavcViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/13.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class BaseNavcViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let navcBar = UINavigationBar.appearance()
        
        // 设置主题se
        navcBar.tintColor = UIColor.blackColor()
        navcBar.barTintColor = UIColor.lightGrayColor()
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        navigationBar.hidden = self.childViewControllers.count == 0
        super.pushViewController(viewController, animated: true)
    }
    
    override func popViewControllerAnimated(animated: Bool) -> UIViewController? {
        navigationBar.hidden = self.childViewControllers.count == 2
        return super.popViewControllerAnimated(animated)
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

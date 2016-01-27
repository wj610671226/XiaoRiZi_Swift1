//
//  MineViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/13.
//  Copyright © 2016年 ty. All rights reserved.
//  我的页面

import UIKit

class MineViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化mineNavc
        initMineNavc()
    }
    
    private func initMineNavc() {
//        titleLabel.text = "我的"
//        leftItem.hidden = true
//        
//        // 设置按钮
//        rightItem.setImage(UIImage(named: "settinghhhh"), forState: .Normal)
//        rightItem.addTarget(self, action: "processSettingItem", forControlEvents: .TouchDown)
//       let item = UIBarButtonItem(title: "测试", style: .Plain, target: self, action: "processSettingItem")
//        navigationItem.rightBarButtonItem = item
//        navigationItem.leftBarButtonItem = item
      navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "settinghhhh"), style: .Plain, target: self, action: "processSettingItem")
    }
    
    // MARK: 点击设置按钮
    func processSettingItem() {
        let detailVC = UIStoryboard(name: "MineViewController", bundle: nil).instantiateViewControllerWithIdentifier("mineDetailVC")
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCellWithIdentifier("mineFirstCell")!
        case 1:
            return tableView.dequeueReusableCellWithIdentifier("mineTwoCell")!
        case 2:
            return tableView.dequeueReusableCellWithIdentifier("mineThirdCell")!
        case 3:
            return tableView.dequeueReusableCellWithIdentifier("mineFourCell")!
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            print(KmainScreenH)
            return KScaleH * 190
        case 1:
            return 68
        case 2:
            return 120
        case 3:
            return 74
        default:
            return 0
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = false
    }
    
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        navigationController?.navigationBar.hidden = true
//    }
    
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

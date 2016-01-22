//
//  FindViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/14.
//  Copyright © 2016年 ty. All rights reserved.
//  发现页面

import UIKit

class FindViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       titleLabel.text = "发现"
        
        // 初始化界面
//        initFindInterface()
    }

    // MARK: 初始化界面
    private func initFindInterface() {
        // 搜索框
        let searchBar = SearchBarView(frame: CGRect(x: 0, y: 64, width: KmainScreenW, height: 40))
//        searchBar.placeholder = "店名，地址"
        view.addSubview(searchBar)
        
        // tabview
        let findTableViewY = CGRectGetMaxY(searchBar.frame)
        let findTableView = UITableView(frame: CGRect(x: 0, y: findTableViewY, width: KmainScreenW, height: KmainScreenH - findTableViewY - KTabBarHeight))
//        findTableView.delegate = self
//        findTableView.dataSource = self
        view.addSubview(findTableView)
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = FindTableViewCell.findTableView(tableView)
        
        // 设置模型
        
        return cell
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

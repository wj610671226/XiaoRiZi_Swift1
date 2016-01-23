//
//  ExploreViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/13.
//  Copyright © 2016年 ty. All rights reserved.
//  探店页面

import UIKit

class ExploreViewController: BaseViewController ,UITableViewDelegate, UITableViewDataSource{

    /// exploreTableView
    weak var exploreTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化导航栏
        initExploreNavc()
        
        // 初始化tableView
        initEXploreTableView()
    }

    // MARK: 初始化导航栏
    private func initExploreNavc() {
        // 设置标题
        titleLabel.text = "探店"
    }
    
    // MARK: 初始化tableView
    private func initEXploreTableView() {
        let expTableView = UITableView(frame: CGRect(x: 0, y: KbackViewH, width: KmainScreenW, height: KmainScreenH - KbackViewH - KTabBarHeight))
        expTableView.delegate = self
        expTableView.dataSource = self
        expTableView.rowHeight = 250
        view.addSubview(expTableView)
        exploreTableView = expTableView
    }

    // MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 创建cell
        let cell = ExploreTableViewCell.cellWithTableView(tableView) as ExploreTableViewCell
        
        cell.backgroundColor = UIColor.redColor()
        // 给cell赋值
        
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

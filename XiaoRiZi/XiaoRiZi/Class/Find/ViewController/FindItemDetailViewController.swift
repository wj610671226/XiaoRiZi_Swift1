//
//  FindItemDetailViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/30.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class FindItemDetailViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    /// tableview
    private var itemDetailTableView: UITableView?
    
    /// 数据源
    private lazy var itemDataSources: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 初始化界面
        initItemDetailInterface()
    }

    // MARK: 初始化界面
    private func initItemDetailInterface() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KmainScreenH))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 200
        tableView.separatorStyle = .None
        view.addSubview(tableView)
        itemDetailTableView = tableView
        
        // 添加刷新
        tableView.mj_header = WJRefreshHeader(refreshingTarget: self, refreshingAction: "getItemDetailMessage")
        tableView.mj_header.beginRefreshing()
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemDataSources.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ItemTableViewCell.cellWithTableView(tableView) 
        if itemDataSources.count > 0 {
            cell.model = itemDataSources[indexPath.row] as? FindItemModel
        }
        return cell
    }

    //MARK: 获取findItem数据
    func getItemDetailMessage() {
        GetNetMessageTool.getLocalMessageWithJsonData("FindItem.json", successBlock: { (responseObject) -> Void in
            print("获取findItem数据 = \(responseObject)")
            
            // 转模型
            let dataArray = FindItemModel.mj_objectArrayWithKeyValuesArray(responseObject["list"])
            self.itemDataSources.addObjectsFromArray(dataArray as [AnyObject])
            
            self.itemDetailTableView?.reloadData()
            self.itemDetailTableView?.mj_header.endRefreshing()
        }) { (errorMessage) -> Void in
            print("获取findItem数据 error = \(errorMessage)")
            self.itemDetailTableView?.mj_header.endRefreshing()
        }
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

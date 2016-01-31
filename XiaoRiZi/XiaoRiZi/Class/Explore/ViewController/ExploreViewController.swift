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
    private weak var exploreTableView: UITableView?
    
    /// 数据源
    private  lazy var exploreDataSources: NSMutableArray = NSMutableArray()
    
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
        let expTableView = UITableView(frame: CGRect(x: 0, y: KbackViewH, width: KmainScreenW, height: KmainScreenH - KTabBarHeight - KbackViewH), style: .Grouped)
        expTableView.delegate = self
        expTableView.dataSource = self
        expTableView.sectionHeaderHeight = 0
        expTableView.sectionFooterHeight = 0
//        expTableView.contentInset = UIEdgeInsetsMake(-35, 0, 0, 0)
        view.addSubview(expTableView)
        exploreTableView = expTableView
        
//        exploreTableView?.mj_header.ignoredScrollViewContentInsetTop = 35
        exploreTableView?.mj_header = WJRefreshHeader(refreshingTarget: self, refreshingAction: "getExploreDataMessage")
        exploreTableView?.mj_header.beginRefreshing()
    }

    // MARK: UITableViewDelegate, UITableViewDataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return exploreDataSources.count ?? 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let model = exploreDataSources[section] as! ExploreModel
        return (model.themes?.count ?? 0) + 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let model = exploreDataSources[indexPath.section] as! ExploreModel
        
        if indexPath.row == 0 {
            // 创建cell
            let cell = ExploreTableViewCell.cellWithTableView(tableView) as ExploreTableViewCell
            
            // 给cell赋值
            cell.model = model
            
            return cell
        } else {
            let cell = ThemesTableViewCell.cellWithTableView(tableView) as ThemesTableViewCell
            
            cell.model = model.themes![indexPath.row - 1]
            
            return cell
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 250
        }
        return 210
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let model = exploreDataSources[indexPath.section] as! ExploreModel
        if indexPath.row == 0 {
            return
        }
        
        let themesModel = model.themes![indexPath.row - 1] as ThemesModel
        let detailVC = ChoiceWebViewController()
        detailVC.url = themesModel.theme_url
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: 获取探店页面数据
    func getExploreDataMessage() {
        GetNetMessageTool.getLocalMessageWithJsonData("Explore.json", successBlock: { (responseObject) -> Void in
            print("获取探店页面数据 = \(responseObject)")
            
            // 设置数组中需要转换的模型类
            ExploreModel.mj_setupObjectClassInArray({ () -> [NSObject : AnyObject]! in
                ["themes":ThemesModel.self, "shops": ShopsModel.self]
            })
            
            // 转模型
            let dataArray = ExploreModel.mj_objectArrayWithKeyValuesArray(responseObject["list"])
            self.exploreDataSources.addObjectsFromArray(dataArray as [AnyObject])
            
            self.exploreTableView?.reloadData()
            self.exploreTableView?.mj_header.endRefreshing()
        }) { (errorMessage) -> Void in
            print("获取探店页面数据 error = \(errorMessage)")
            self.exploreTableView?.mj_header.endRefreshing()
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

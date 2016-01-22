//
//  ChoiceViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/14.
//  Copyright © 2016年 ty. All rights reserved.
//  精选页面

import UIKit
import MJRefresh
class ChoiceViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     控制 详细页面显示的内容样式
     */
    
    enum DetailType: Int {
        case DetailTypeWebView = 5
        case DetailTypeOther          // 其他
    }
    
    /// tableView
    var choiceTableView: UITableView!
    
    lazy var choiceDatasources: [ChoiceListModel] = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化导航栏
        initChoiceNavc()
        
        // 初始化tableView
        initChoicTableView()    
    }

    // MARK: 初始化tableView
    private func initChoicTableView() {
        choiceTableView = UITableView(frame: CGRect(x: 0, y: KbackViewH, width: KmainScreenW, height: KmainScreenH - KbackViewH - KTabBarHeight))
        choiceTableView.delegate = self
        choiceTableView.dataSource = self
        choiceTableView.rowHeight = 200;
        choiceTableView.separatorStyle = .None
        view.addSubview(choiceTableView)
        
        // 添加刷新
        choiceTableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "getNetDataMessage")
        // 开始刷新
        choiceTableView.mj_header.beginRefreshing()
    }
    
    // MARK: UITableViewDataSource, UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.choiceDatasources.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 快速创建cell
        let cell = ChoiceTableViewCell.initWithCustomCell(tableView)
        
        // 设置模型
        cell.model = choiceDatasources[indexPath.row]
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let model = choiceDatasources[indexPath.row]
        var detailVC: UIViewController?
        if model.theme_type == String(DetailType.DetailTypeWebView.rawValue) {
            // 下一页是网页显示的内容
            detailVC = ChoiceWebViewController()
            (detailVC as! ChoiceWebViewController).url = model.theme_url
            (detailVC as! ChoiceWebViewController).isCollection = false
        } else {
            detailVC = ChiceDetailController()
            detailVC?.title = model.title
        }
        navigationController?.pushViewController(detailVC!, animated: true)
    }
    
    // MARK: 初始化导航栏
    private func initChoiceNavc() {
        titleLabel.text = "精选"
        // 附近
        rightItem.setTitle("附近", forState: .Normal)
        rightItem.addTarget(self, action: "processNearItem", forControlEvents: .TouchDown)
    }
    
    // MARK: 获取网络数据
    func getNetDataMessage() {
        // 获取数据
        GetNetMessageTool.getLocalMessageWithJsonData("Choice.json", successBlock: { (responseObject) -> Void in
            print(responseObject)
            // 转模型
            let modelArrayData = ChoiceListModel.mj_objectArrayWithKeyValuesArray(responseObject["list"])
            for model in modelArrayData {
                self.choiceDatasources.append(model as! ChoiceListModel)
            }
            
            self.choiceTableView.reloadData()
            
            // 停止刷新
            self.choiceTableView.mj_header.endRefreshing()
        }) { (errorMessage) -> Void in
            print("error = \(errorMessage)")
            
            self.choiceTableView.mj_header.endRefreshing()
        }
    }
    
    //  MARK: 点击附近按钮
    func processNearItem() {
        print("附近")
        navigationController?.pushViewController(ChoiceNearViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
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

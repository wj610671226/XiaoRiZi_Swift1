//
//  ChiceDetailController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ChiceDetailController: UIViewController , UITableViewDelegate, UITableViewDataSource, ChoiceDetailTableViewCellDelegate{

    /// detailTableView
    weak var detailTableView: UITableView!
    
    /// 数据源
    private lazy var dataSources: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()

        // 初始化tableView
        initDetailTableView()
        
        // 获取数据
        getDetailmessage()
    }

    // MARK: 初始化tableView
    private func initDetailTableView() {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: KmainScreenW, height: KmainScreenH))
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = KtopViewH + KbottomViewH * 2 + Kpadding
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0)
        detailTableView = tableView
    }
    
    // MARK : UITableViewDataSource, UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = ChoiceDetailTableViewCell.cellWithTableView(tableView, indexPath: indexPath)
        
        // 设置数据模型
        cell.detailModel = dataSources[indexPath.row] as? ChoiceDetailModel
        
        // 设置代理
        cell.delegate = self
        
        return cell
    }
    
    // MARK: 获取详细的数据
    private func getDetailmessage() {
        GetNetMessageTool.getLocalMessageWithJsonData("ChoiceDetail.json", successBlock: { (responseObject) -> Void in
            print("detail = \(responseObject)")
            ChoiceDetailModel.mj_setupObjectClassInArray({ () -> [NSObject : AnyObject]! in
                ["article": "ArticleModel"]
            })
            let data = ChoiceDetailModel.mj_objectArrayWithKeyValuesArray(responseObject["list"])
            
            self.dataSources.addObjectsFromArray(data as [AnyObject])
            
            }) { (errorMessage) -> Void in
                print("error = \(errorMessage)")
        }
    }
    
    // MARK: 进入详细页
    func processBtnPushDetailViewController(currentBtnTitle: String) {
        let deatailVC = ChoiceWebViewController()
        deatailVC.isCollection = true
        let row: NSInteger = NSInteger(currentBtnTitle.substringToIndex(currentBtnTitle.startIndex.successor()))!
        let number: NSInteger = NSInteger(currentBtnTitle.substringFromIndex(currentBtnTitle.startIndex.successor()))!
        
        let choiceDetailModel = dataSources[row] as! ChoiceDetailModel
        let model = choiceDetailModel.article![number] as! ArticleModel
        deatailVC.url = model.url
        navigationController?.pushViewController(deatailVC, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.hidden = true
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

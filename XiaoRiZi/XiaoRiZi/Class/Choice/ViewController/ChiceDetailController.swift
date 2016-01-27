//
//  ChiceDetailController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/19.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class ChiceDetailController: UIViewController , UITableViewDelegate, UITableViewDataSource, ChoiceDetailTableViewCellDelegate {

    /// detailTableView
    private weak var detailTableView: UITableView!
    
    /// 数据源
    private lazy var dataSources: NSMutableArray = NSMutableArray()
    
    /// 判断显示的cell的类型
    var cellType: Int?
    
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
        tableView.separatorStyle = .None
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 10, 0)
        detailTableView = tableView
    }
    
    // MARK : UITableViewDataSource, UITableViewDelegate
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSources.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch cellType! {
        case 0: // 每天cell
            let cell = ChoiceDetailTableViewCell.cellWithTableView(tableView, indexPath: indexPath)
            
            if dataSources.count > 0 {
                // 设置数据模型
                cell.detailModel = dataSources[indexPath.row] as? ChoiceDetailModel
            }
            
            // 设置代理
            cell.delegate = self
            
            return cell
        case 1: // 周末
            let cell = ChoiceWeekTableViewCell.cellWithTableView(tableView)
            
            if dataSources.count > 0 {
                cell.weekModel = dataSources[indexPath.row] as? WeekModel
            }
            
            return cell
        case 3: // 匠人志
            let cell = ChoiceCraftsmenTableViewCell.cellWithTableView(tableView)
            
            if dataSources.count > 0 {
                cell.model = dataSources[indexPath.row] as? CiaftsmenModel
            }
            
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch cellType! {
        case 1:
            print("meitian")
        case 3:
            let webVC = ChoiceWebViewController()
            webVC.url = (dataSources[indexPath.row] as? CiaftsmenModel)?.url
            navigationController?.pushViewController(webVC, animated: true)
        default:
            print("didSelectRowAtIndexPath")
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch cellType! {
        case 0:
            return KtopViewH + KbottomViewH * 2 + Kpadding
        case 1:
            return 300
        case 3:
            return 350
        default:
            return 0
        }
    }
    // MARK: 获取详细的数据
    private func getDetailmessage() {
        dataSources.removeAllObjects()
        switch cellType! {
        case 0:
            getBeautyDayMessage()
        case 1:
            getWeekMessage()
        case 3:
            getCraftsMessage()
        default:
            print("default")
        }
    }
    
    // 获取每天的数据
    private func getBeautyDayMessage() {
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
    
    // 获取周末的数据
    private func getWeekMessage() {
        GetNetMessageTool.getLocalMessageWithJsonData("Week.json", successBlock: { (responseObject) -> Void in
            print("获取周末的数据 = \(responseObject)")
            // 转模型
            let dataArray = WeekModel.mj_objectArrayWithKeyValuesArray(responseObject["list"])
            self.dataSources.addObjectsFromArray(dataArray as [AnyObject])
            
            self.detailTableView.reloadData()
        }) { (errorMessage) -> Void in
                print("获取周末的数据 = \(errorMessage)")
        }
    }
    
    // 获取匠人的数据
    private func getCraftsMessage() {
        GetNetMessageTool.getLocalMessageWithJsonData("Craftsmen.json", successBlock: { (responseObject) -> Void in
            print("获取匠人的数据 = \(responseObject)")
            // 转模型
            let dataArray = CiaftsmenModel.mj_objectArrayWithKeyValuesArray(responseObject["list"])
            self.dataSources.addObjectsFromArray(dataArray as [AnyObject])
            
            self.detailTableView.reloadData()
        }) { (errorMessage) -> Void in
                print("获取匠人的数据 = \(errorMessage)")
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

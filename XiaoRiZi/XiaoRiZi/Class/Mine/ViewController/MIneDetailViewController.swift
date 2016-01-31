//
//  MIneDetailViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/26.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class MIneDetailViewController: UITableViewController {

    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.tableFooterView = UIView()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCellWithIdentifier("firstCell")!
        case 1:
            return tableView.dequeueReusableCellWithIdentifier("secondCell")!
        case 2:
            return tableView.dequeueReusableCellWithIdentifier("thirdCell")!
        case 3:
            let cell = tableView.dequeueReusableCellWithIdentifier("fourCell")!
            cell.detailTextLabel?.text = getCacheSize()
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            UIApplication.sharedApplication().openURL(NSURL(string: "http://blog.csdn.net/wj610671226")!)
        case 1:
            print("")
        case 2:
            print("")
        case 3:
            // 清理缓存
            WJFileTool.clearCacheFile(NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last!, clearSuccess: { () -> Void in
                let index = NSIndexPath(forRow: 3, inSection: 0)
                self.detailTableView.reloadRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.None)
            })
        default:
            print("")
        }
    }
    
    // 获取缓存文件的大小
    private func getCacheSize() -> String {
        let path =  NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
        let pathSize = WJFileTool.getFolderCacheFileSize(path!)
        return String(format: "%.2fM", pathSize)
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

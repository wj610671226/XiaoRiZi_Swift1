//
//  CityViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/17.
//  Copyright © 2016年 ty. All rights reserved.
//

import UIKit

class CityViewController: BaseViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    /// 间隔
    let cellPadding: CGFloat = 1
    
    /// cellID
    let cellID: String = "cityCellID"
    
    /// cityFooterID
    let cityFooterID: String = "cityFooterID"
    /// cityHeaderID
    let cityHeaderID: String = "cityHeaderID"
    
    lazy var cityData: [AnyObject] = Array()
    
    // 当前城市
    lazy var currentCity: String = {
        return SaveMessageTool.readeCurrentCityMessage(KCityKey)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        
        // 获取城市数据
        getCityData()

        // 初始化导航栏
        initCityNavcBar()
        
        // 初始化collectionView
        initCollectionView()
    }

    // MARK: 初始化collectionView
    private func initCollectionView() {
        let layout = XLPlainFlowLayout()
        layout.minimumLineSpacing = cellPadding
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: KmainScreenW / 3.0 - 1.0, height: 50)
        layout.sectionInset = UIEdgeInsetsMake(cellPadding, 0, 0, 0)
        layout.headerReferenceSize = CGSize(width: KmainScreenW, height: 50)
        
        let cityColletionView = UICollectionView(frame: CGRect(x: 0, y: KbackViewH, width: KmainScreenW, height: KmainScreenH - KbackViewH), collectionViewLayout: layout)
        cityColletionView.delegate = self
        cityColletionView.dataSource = self
        cityColletionView.backgroundColor = UIColor.init(colorLiteralRed: 245 / 255.0, green: 245 / 255.0, blue: 245 / 255.0, alpha: 1)
        cityColletionView.showsVerticalScrollIndicator = false
        view.addSubview(cityColletionView)
        
        // 注册cell
        cityColletionView.registerNib(UINib(nibName: "CityCollectionViewCell", bundle: nil
            ), forCellWithReuseIdentifier: cellID)
        // 注册  UICollectionReusableView
        cityColletionView.registerClass(CityHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cityHeaderID)
        cityColletionView.registerClass(CityFooterCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: cityFooterID)
    }
    
    // MARK: 初始化导航栏
    private func initCityNavcBar() {
        super.leftItem.setTitle("取消", forState: .Normal)
        super.leftItem.setImage(nil, forState: .Normal)
        super.titleLabel.text = "选择城市"
    }
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return cityData.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return cityData.first?.count ?? 0
        }
        return cityData.last?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellID, forIndexPath: indexPath) as! CityCollectionViewCell
        // 设置数据
        cell.cityLabel.text = cityData[indexPath.section][indexPath.row] as? String
        
        if currentCity == cell.cityLabel.text {
            cell.cityLabel.textColor = UIColor.redColor()
        } else {
            cell.cityLabel.textColor = UIColor.blackColor()
        }
        
        return cell
    }

    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionFooter {
            let cityFooterView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionFooter, withReuseIdentifier: cityFooterID, forIndexPath: indexPath) as! CityFooterCollectionReusableView
            return cityFooterView
        }
        
        let cityHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: cityHeaderID, forIndexPath: indexPath) as! CityHeaderCollectionReusableView
        if indexPath.section == 0 {
            cityHeaderView.headerLabel.text = "国内"
        } else {
            cityHeaderView.headerLabel.text = "国外"
        }
        return cityHeaderView
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSizeZero
        } else {
            return CGSizeMake(KmainScreenW, 50)
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let title = cityData[indexPath.section][indexPath.row] as? String
        if title != nil {
//            super.leftItem.setTitle(title, forState: .Normal)
            // 发送城市改变的通知
            NSNotificationCenter.defaultCenter().postNotificationName(CityChangeNSNotificationName, object: title)
            processLtfeItem()
        }
    }
    
    // MARK: 获取城市数据
    private func getCityData() {
        GetNetMessageTool.getLocalMessageWithJsonData("City.json", successBlock: { (responseObject) -> Void in
            let data = ((responseObject as! NSDictionary)["city"]) as! NSArray
            // 国外
            var oversea: [String] = Array()
            // 国内
            var domestic: [String] = Array()
            for model in data {
                if model["parent_id"] as? NSNumber == 106 {
                    oversea.append(model["name"] as! String)
                } else {
                    domestic.append(model["name"] as! String)
                }
            }
            domestic.append("")
            domestic.append("")
            self.cityData.append(domestic)
            self.cityData.append(oversea)
            }) { (errorMessage) -> Void in
        }
    }
    
    // 点击取消按钮
    override func processLtfeItem() {
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    deinit {
        print("CityViewController 释放")
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

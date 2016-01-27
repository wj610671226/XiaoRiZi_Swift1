//
//  FindViewController.swift
//  XiaoRiZi
//
//  Created by ty on 16/1/14.
//  Copyright © 2016年 ty. All rights reserved.
//  发现页面

import UIKit

class FindViewController: BaseViewController , UICollectionViewDelegate, UICollectionViewDataSource {

    /// findCollectionView
    private weak var findCollectionView: UICollectionView?
    
    /// collectionCellID
    private let COLLECTION_CELLID: String = "FindCollectionViewCellID"
    
    /// collectionHeaderID
    private let COLLECTION_HEADERID: String = "FindCollectionViewHeaderID"
    
    /// 数据源
    private lazy var findDataSources: NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "发现"
        view.backgroundColor = UIColor.init(red: 240 / 255.0, green: 240 / 255.0, blue: 240 / 255.0, alpha: 1)
        
        // 初始化界面
        initFindInterface()
        
        getFindData()
    }

    // MARK: 初始化界面
    private func initFindInterface() {
        // 搜索框
        let searchBar = SearchBarView(frame: CGRect(x: Kpadding, y: 74, width: KmainScreenW - 2 * Kpadding, height: 35))
        view.addSubview(searchBar)
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = Kpadding / 2
        layout.minimumInteritemSpacing = 0
        let itemW = (KmainScreenW - 2 * Kpadding) / 3 - 1.0
        let itemH: CGFloat = 100
        layout.itemSize = CGSize(width: itemW, height: itemH)
        layout.headerReferenceSize = CGSize(width: KmainScreenW, height: 250)
        layout.sectionInset = UIEdgeInsetsMake(Kpadding / 2, Kpadding / 2, Kpadding / 2, Kpadding / 2)

        // collectionView
        let collectionViewY: CGFloat = CGRectGetMaxY(searchBar.frame) + Kpadding
        let collectionViewH: CGFloat = KmainScreenH - collectionViewY - KTabBarHeight
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: collectionViewY, width: KmainScreenW, height: collectionViewH), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.whiteColor()
        findCollectionView = collectionView
        view.addSubview(collectionView)
        
        // 注册
        collectionView.registerNib(UINib(nibName: "FindCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: COLLECTION_CELLID)
        collectionView.registerClass(FindCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: COLLECTION_HEADERID)
    }
    
    // MARK: UICollectionViewDelegate, UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return findDataSources.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(COLLECTION_CELLID, forIndexPath: indexPath) as? FindCollectionViewCell

        // 设置模型
        if findDataSources.count > 0 {
            cell?.model = findDataSources[indexPath.row] as? FindModel
        }
        
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: COLLECTION_HEADERID, forIndexPath: indexPath)
        headerView.backgroundColor = UIColor.redColor()
        return headerView
    }
    
    
    // MARK: 获取数据
    private func getFindData() {
        GetNetMessageTool.getLocalMessageWithJsonData("Find.json", successBlock: { (responseObject) -> Void in
            print(responseObject)
            // 转模型
            
            let jsonArray = responseObject["list"]!![0]["tags"]
            let dataArray = FindModel.mj_objectArrayWithKeyValuesArray(jsonArray)
            self.findDataSources.addObjectsFromArray(dataArray as [AnyObject])
            
            self.findCollectionView?.reloadData()
            
            }) { (errorMessage) -> Void in
                print("error = \(errorMessage)")
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

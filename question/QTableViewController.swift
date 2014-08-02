//
//  AbstractTableViewController.swift
//  question
//
//  Created by 朱涛 on 14/8/2.
//  Copyright (c) 2014年 朱涛. All rights reserved.
//

import Foundation




class QTableViewController:UITableViewController{
    
    var url: String?
    
    var identifier: String?
    
    var page :Int = 1
    
    var dataArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var refresh = UIRefreshControl()
        refresh.attributedTitle = NSAttributedString(string: "刷新")
        refresh.addTarget(self, action: "refresh", forControlEvents:.ValueChanged)
        self.refreshControl = refresh
        var nib = UINib(nibName:identifier, bundle: nil)
        self.tableView?.registerNib(nib, forCellReuseIdentifier:identifier)
    }
    

     func refresh(){
        beginRefresh()
        loadData()
        endRefresh()
    }
    
    func beginRefresh(){
        self.refreshControl.beginRefreshing()
        self.refreshControl.attributedTitle = NSAttributedString(string: "刷新中...")
    }
    
    func endRefresh(){
        self.refreshControl.attributedTitle = NSAttributedString(string: "刷新成功")
        self.refreshControl.endRefreshing()
        self.refreshControl.attributedTitle = NSAttributedString(string: "刷新")
    }
    
    func loadData()
    {
       
        YRHttpRequest.requestWithURL(url!,completionHandler:{ data in
            if data as NSObject == NSNull()
            {
                UIView.showAlertView("提示",message:"加载失败")
                return
            }
            var arr = data["items"] as NSArray
            for data : AnyObject  in arr
            {
                self.dataArray.addObject(data)
            }
            self.tableView!.reloadData()
            self.page++
            })
    }
    
    // #pragma mark - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        var cell = tableView?.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? UITableViewCell
        var index = indexPath!.row
        var data = self.dataArray[index] as NSDictionary
        buildTableViewCell(cell!, data: data)
        return cell
    }
    
    func buildTableViewCell(cell:UITableViewCell,data:NSDictionary){
        
    }
    
    
    override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        var index = indexPath!.row
        var data = self.dataArray[index] as NSDictionary
        return self.cellHeightByData(data)
    }
    
    func cellHeightByData(data:NSDictionary)->CGFloat{
        return 44
    }
    
    func  selectTableForDetailController(data:NSDictionary)-> UIViewController{
        return UIViewController()
    }
    
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        var index = indexPath!.row
        var data = self.dataArray[index] as NSDictionary
        let detailController=selectTableForDetailController(data)
        self.navigationController.pushViewController(detailController, animated: true)
    }
    
    
    

    
    
}
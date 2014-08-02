//
//  LeftViewController.swift
//  bar
//
//  Created by 朱涛 on 14/7/27.
//  Copyright (c) 2014年 朱涛. All rights reserved.
//

import Foundation
import UIKit


class LeftViewController : UITableViewController{
    
    let  menus = ["首页", "名师","好友","附近", "消息","设置"];
    
    var questionViewDeckController: QuestionViewDeckController?
    
    func setQuestionViewDeckController(questionViewDeckController: QuestionViewDeckController){
         self.questionViewDeckController=questionViewDeckController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var  imageBgV =  UIImageView(frame: self.view.bounds)
        imageBgV.image=UIImage(named: "sidebar_bg.jpg")
        self.tableView.backgroundView=imageBgV
        self.tableView.separatorStyle=UITableViewCellSeparatorStyle.None
    }
    
    //显示状态栏
    override func tableView(tableView: UITableView!, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(20)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1;
    }
    

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
         return menus.count;
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var row=indexPath.row
        let cell =  UITableViewCell()
        cell.backgroundColor=UIColor.clearColor()
        var cellHeight = cell.frame.size.height;
        var cellWidth = cell.frame.size.width;
        var textLabel=UILabel()
        textLabel.frame=CGRectMake(40, 50, cellWidth-40, cellHeight-100)
        textLabel.text=menus[row]
        textLabel.textColor=UIColor.whiteColor()
        textLabel.backgroundColor=UIColor.clearColor()
        cell.addSubview(textLabel)
        cell.selectionStyle = UITableViewCellSelectionStyle.None;
        return cell;
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let completionBlock:(IIViewDeckController!,Bool)-> Void = { viewDeckController,success in
            (viewDeckController as QuestionViewDeckController).switchCenter(indexPath.row,title: self.menus[indexPath.row])
        }
        questionViewDeckController?.closeLeftViewAnimated (true, completion: completionBlock)
    }
}

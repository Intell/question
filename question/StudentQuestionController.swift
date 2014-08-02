//
//  StudentQuestionController.swift
//  question
//
//  Created by 朱涛 on 14/8/1.
//  Copyright (c) 2014年 朱涛. All rights reserved.
//

import Foundation

class StudentQuestionController :QTableViewController{
    

    
    override func viewDidLoad() {
        identifier = "StudentQuestionCell"
        url = "http://m2.qiushibaike.com/article/list/suggest?count=20&page=\(page)"
        super.viewDidLoad()
    }

    override func buildTableViewCell(cell:UITableViewCell,data:NSDictionary){
         (cell as StudentQuestionCell).data = data
    }
    
    
    override func cellHeightByData(data:NSDictionary)->CGFloat{
        return  StudentQuestionCell.cellHeightByData(data)
    }
    
    override func  selectTableForDetailController(data:NSDictionary)-> UIViewController{
        return UIViewController()
    }


    
}

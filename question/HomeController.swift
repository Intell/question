//
//  HomeController.swift
//  question
//
//  Created by 朱涛 on 14/7/30.
//  Copyright (c) 2014年 朱涛. All rights reserved.
//

import Foundation

class HomeController :UITabBarController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem =  UIBarButtonItem(image: UIImage(named: "hamburger.png"), style: UIBarButtonItemStyle.Bordered, target: self.viewDeckController, action:"toggleLeftView")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
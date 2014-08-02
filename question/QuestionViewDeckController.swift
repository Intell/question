//
//  QuestionViewDeckController.swift
//  question
//
//  Created by 朱涛 on 14/7/27.
//  Copyright (c) 2014年 朱涛. All rights reserved.
//

import Foundation

class QuestionViewDeckController:IIViewDeckController{
    
   let  controllerNames = ["homeController", "teacherController", "名师", "附近", "消息","设置"];
   let  leftViewControllerName="LeftViewController"
   let  storyboardName="Main"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var  storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        var centerController = storyboard.instantiateViewControllerWithIdentifier(controllerNames[0]) as UIViewController
        centerController.title="首页"
        self.centerController = UINavigationController(rootViewController: centerController)
        var leftController = storyboard.instantiateViewControllerWithIdentifier(leftViewControllerName) as LeftViewController
        leftController.setQuestionViewDeckController(self)
        self.leftController = leftController as UIViewController
        leftSize = 200;
        openSlideAnimationDuration = 0.25; // In seconds
        closeSlideAnimationDuration = 0.25;
        bounceOpenSideDurationFactor = 0.25
    }
    
    func switchCenter(menuIndex:Int,title:String){
        var  storyboard = UIStoryboard(name: "Main", bundle: nil)
        var centerController = storyboard.instantiateViewControllerWithIdentifier(controllerNames[menuIndex]) as UIViewController
        centerController.title=title
        self.centerController = UINavigationController(rootViewController: centerController)
    }
    
}

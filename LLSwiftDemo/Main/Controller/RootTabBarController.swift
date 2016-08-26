//
//  RootTabBarController.swift
//  LLSwiftDemo
//
//  Created by Keith on 16/7/16.
//  Copyright © 2016年 Keith. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIApplication.sharedApplication().applicationIconBadgeNumber = 99;
        addChildViewControllers()
        self.tabBar.tintColor = UIColor(red: 0.04, green: 0.73, blue: 0.03, alpha: 1.0)
        // Do any additional setup after loading the view.
    }

    func addChildViewControllers(){
        addChildViewController(HomeViewController(), title: "微信", imageName: "tabbar_home",selectedImageName:"tabbar_home_selected")
        addChildViewController(ContactViewController(), title: "通讯录", imageName: "tabbar_contact",selectedImageName: "tabbar_contact_selected")
        addChildViewController(DiscoverViewController(), title: "发现", imageName: "tabbar_discover",selectedImageName: "tabbar_discover_selected")
        addChildViewController(MYViewController(style: UITableViewStyle.Grouped), title: "我", imageName: "tabbar_me",selectedImageName: "tabbar_me_selected")
    }
    
    func addChildViewController(controller:UIViewController, title:String, imageName:String, selectedImageName:String){

        let nav = BaseNavigationController(rootViewController: controller)
        nav.tabBarItem.title = title;
        nav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor(red: 0.04, green: 0.73, blue: 0.03, alpha: 1.0)], forState: UIControlState.Selected)
        
        nav.tabBarItem.image = UIImage(named: imageName)
        nav.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
        addChildViewController(nav)
    }
}

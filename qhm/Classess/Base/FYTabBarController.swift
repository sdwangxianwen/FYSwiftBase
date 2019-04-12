//
//  FYTabBarController.swift
//  qhm
//
//  Created by wang on 2019/4/12.
//  Copyright © 2019 wang. All rights reserved.
//

import UIKit

class FYTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChild()
        
    }
    
    func setupChild() {
        let homeVC = FYHomeViewController.init()
        let meVC = FYMeViewController.init()
        addChild(homeVC, title: "首页", imageName: "", imageSelectName: "")
        addChild(meVC, title: "我的", imageName: "", imageSelectName: "")
        
    }
    
    func addChild(_ childController: UIViewController,title:String,imageName:String,imageSelectName:String) {
        childController.title = title
        childController.tabBarItem.image = UIImage.init(named: imageName)
        childController.tabBarItem.selectedImage = UIImage.init(named: imageSelectName)
        let nav = FYNavgationController.init(rootViewController:childController)
        addChild(nav)
    }
}

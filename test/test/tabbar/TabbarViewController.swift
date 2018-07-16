//
//  TabbarViewController.swift
//  test
//
//  Created by ryoku on 2018/07/16.
//  Copyright © 2018 ryokuhei_sato. All rights reserved.
//
import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        
        // collection view
        let collectionViewController = UIStoryboard(name: "collection", bundle: nil).instantiateInitialViewController() as! CollectionViewController
        collectionViewController.tabBarItem = UITabBarItem(title: "collection", image: nil, tag: 0)
        
        // table view
        let tableViewController = UIStoryboard(name: "table", bundle: nil).instantiateInitialViewController() as! TableViewController
        tableViewController.tabBarItem = UITabBarItem(title: "table", image: nil, tag: 1)

        // set tabView
        let viewControllers = [collectionViewController, tableViewController]
        
        setViewControllers(viewControllers, animated: true)
        
    }
    
}

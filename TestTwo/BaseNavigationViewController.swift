//
//  BaseNavigationViewController.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/30.
//

import UIKit

class BaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0
        {
            viewController.hidesBottomBarWhenPushed=true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
   
}

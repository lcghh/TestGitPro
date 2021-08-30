//
//  BaseTabbarViewController.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/30.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    private let tabbarBackgroundView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(red: 9/255.0, green: 187/255.0, blue: 7/255.0, alpha: 1)
        // Do any additional setup after loading the view.
        configTabbar()
        configViewControllers();
    }
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            tabbarBackgroundView.frame = tabBar.frame
        }

    
    func configTabbar() -> Void {
        tabbarBackgroundView.layer.cornerRadius = 10
        tabbarBackgroundView.backgroundColor = .white
        tabbarBackgroundView.layer.shadowColor = UIColor.black.cgColor
        tabbarBackgroundView.layer.shadowOffset = CGSize(width: 0, height: -5)
        tabbarBackgroundView.layer.shadowRadius = 10
        tabbarBackgroundView.clipsToBounds = false
        tabbarBackgroundView.layer.shadowOpacity = 0.5
        view.addSubview(tabbarBackgroundView)

        view.bringSubviewToFront(tabBar)

        tabBar.layer.cornerRadius = 20
        tabBar.layer.masksToBounds = true

    }
    
    
    
    func configViewControllers() -> Void {
        let wechat = OrdersStatusViewController()
        // 未选中状态Tab图片
        wechat.tabBarItem.image = UIImage(named: "tab1")?.withRenderingMode(.alwaysOriginal)
        // 选中状态Tab图片
        wechat.tabBarItem.selectedImage = UIImage(named: "selectTab1")?.withRenderingMode(.alwaysOriginal)
        // Tab的文本
        wechat.tabBarItem.title = "微信"
        
        
        let addressBook = ViewController()
        addressBook.tabBarItem.image = UIImage(named: "tab2")?.withRenderingMode(.alwaysOriginal)
        addressBook.tabBarItem.selectedImage = UIImage(named: "selectTab2")?.withRenderingMode(.alwaysOriginal)
        addressBook.tabBarItem.title = "通讯录"
        
        let find = ViewController()
        find.tabBarItem.image = UIImage(named: "tab3")?.withRenderingMode(.alwaysOriginal)
        find.tabBarItem.selectedImage = UIImage(named: "selectTab3")?.withRenderingMode(.alwaysOriginal)
        find.tabBarItem.title = "发现"
        
        let mine = ViewController()
        mine.tabBarItem.image = UIImage(named: "tab4")?.withRenderingMode(.alwaysOriginal)
        find.tabBarItem.selectedImage = UIImage(named: "selectTab4")?.withRenderingMode(.alwaysOriginal)
        mine.tabBarItem.title = "我的"
        viewControllers = [wechat,addressBook,find,mine]
    }

    

}

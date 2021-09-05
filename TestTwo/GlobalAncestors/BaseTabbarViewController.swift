//
//  BaseTabbarViewController.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/30.
//

import UIKit

class BaseTabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = UIColor(hex: "#6487DA")
        // Do any additional setup after loading the view.
        configTabbar()
        configViewControllers();
    }
    
    func configTabbar() -> Void {
        
        tabBar.shadowImage = UIImage()
        
        let tabbarBackgroundView = UIView()
        
        let delegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let tabbarHeight = 49.0 + delegate.keyWindow!.safeAreaInsets.bottom
        
        
        
        
        // 圆角大小
        tabbarBackgroundView.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: tabbarHeight)
        let radius: CGFloat = 9;
        // 圆角位置
        let corner: UIRectCorner = [.topLeft, .topRight]
        //frame可以先计算完成  避免圆角拉伸
        let rect = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: tabbarHeight)
        let path: UIBezierPath = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = rect;
        maskLayer.path = path.cgPath
        tabbarBackgroundView.layer.mask = maskLayer;
        
        tabbarBackgroundView.backgroundColor = UIColor(hex: "#FFFFFF")
       
        
        let image = getCustomTabbarImage(view: tabbarBackgroundView)
        
        UITabBar.appearance().backgroundImage = image;
        
        
    }
    
    func getCustomTabbarImage(view:UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        UIColor.clear.set()
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    
    func configViewControllers() -> Void {
        let wechat = BaseNavigationViewController(rootViewController: OrdersStatusViewController())
        // 未选中状态Tab图片
        wechat.tabBarItem.image = UIImage(named: "tab1")?.withRenderingMode(.alwaysOriginal)
        // 选中状态Tab图片
        wechat.tabBarItem.selectedImage = UIImage(named: "selectTab1")?.withRenderingMode(.alwaysOriginal)
        // Tab的文本
        wechat.tabBarItem.title = "微信"
        
        
        let addressBook = BaseNavigationViewController(rootViewController: ViewController())
        addressBook.tabBarItem.image = UIImage(named: "tab2")?.withRenderingMode(.alwaysOriginal)
        addressBook.tabBarItem.selectedImage = UIImage(named: "selectTab2")?.withRenderingMode(.alwaysOriginal)
        addressBook.tabBarItem.title = "通讯录"
        
        let find = BaseNavigationViewController(rootViewController: ViewController())
        find.tabBarItem.image = UIImage(named: "tab3")?.withRenderingMode(.alwaysOriginal)
        find.tabBarItem.selectedImage = UIImage(named: "selectTab3")?.withRenderingMode(.alwaysOriginal)
        find.tabBarItem.title = "发现"
        
        let mine = BaseNavigationViewController(rootViewController: ViewController())
        mine.tabBarItem.image = UIImage(named: "tab4")?.withRenderingMode(.alwaysOriginal)
        find.tabBarItem.selectedImage = UIImage(named: "selectTab4")?.withRenderingMode(.alwaysOriginal)
        mine.tabBarItem.title = "我的"
        viewControllers = [wechat,addressBook,find,mine]
    }

    

}

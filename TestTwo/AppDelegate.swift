//
//  AppDelegate.swift
//  TestTwo
//
//  Created by lichao on 2021/8/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var keyWindow:UIWindow?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let rootVC = BaseTabbarViewController();
        keyWindow = UIWindow(frame: UIScreen.main.bounds)
        keyWindow?.rootViewController = rootVC
        keyWindow?.backgroundColor = UIColor.white
        keyWindow?.makeKeyAndVisible()
        
        return true
    }


}


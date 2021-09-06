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
        
        keyWindow = UIWindow(frame: UIScreen.main.bounds)
        keyWindow!.backgroundColor = UIColor.white
//        let rootVC = BaseTabbarViewController();
        let rootVC = LoginViewController();
        keyWindow!.rootViewController = rootVC
        keyWindow!.makeKeyAndVisible()
        
        return true
    }
    
   func loginSuccess() -> Void {
        let rootVC = BaseTabbarViewController();
        keyWindow!.rootViewController = rootVC
    }


}


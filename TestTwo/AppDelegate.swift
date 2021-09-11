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
        let rootVC = BaseTabbarViewController();
//        let rootVC = LoginViewController();
//        keyWindow!.rootViewController = rootVC
        keyWindow?.rootViewController = scanVC()
        keyWindow!.makeKeyAndVisible()
        
        return true
    }
    
    func scanVC() -> UIViewController {
        //设置扫码区域参数
        var style = ScanViewStyle()
        style.centerUpOffset = 44
        style.photoframeAngleStyle = ScanViewPhotoframeAngleStyle.On
        style.photoframeLineW = 6
        style.photoframeAngleW = 24
        style.photoframeAngleH = 24
        style.isNeedShowRetangle = true

        style.anmiationStyle = ScanViewAnimationStyle.NetGrid

        //矩形框离左边缘及右边缘的距离
        style.xScanRetangleOffset = 80

        //使用的支付宝里面网格图片
        style.animationImage = UIImage(named: "CodeScan.bundle/qrcode_scan_part_net")

        let vc = ScanViewController()
        vc.scanStyle = style

        vc.isOpenInterestRect = true
       return vc
    }

    
   func loginSuccess() -> Void {
        let rootVC = BaseTabbarViewController();
        keyWindow!.rootViewController = rootVC
    }


}


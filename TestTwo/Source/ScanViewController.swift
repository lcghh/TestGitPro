//
//  LBXScanViewController.swift
//  swiftScan
//
//  Created by lbxia on 15/12/8.
//  Copyright © 2015年 xialibing. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

public protocol ScanViewControllerDelegate: class {
     func scanFinished(scanResult: ScanResult, error: String?)
}

open class ScanViewController: UIViewController {
    
    // 返回扫码结果，也可以通过继承本控制器，改写该handleCodeResult方法即可
    open weak var scanResultDelegate: ScanViewControllerDelegate?

    open var scanObj: ScanWrapper?

    open var scanStyle: ScanViewStyle? = ScanViewStyle()

    open var qRScanView: ScanView?

    // 启动区域识别功能
    open var isOpenInterestRect = false
    
    //连续扫码
    open var isSupportContinuous = false;

    // 识别码的类型
    public var arrayCodeType: [AVMetadataObject.ObjectType]?

    // 相机启动提示文字
    public var readyString: String! = "loading"

    open override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        // [self.view addSubview:_qRScanView];
        view.backgroundColor = UIColor.black
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
        
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(focusGestue(gesture:)))
        
        
        view.addGestureRecognizer(gesture)
    }
    
    @objc func focusGestue(gesture:UITapGestureRecognizer) -> Void {
        let point = gesture.location(in: view)
        scanObj?.focusAtPoint(point: point)
    }

    // 设置框内识别
    open func setOpenInterestRect(isOpen: Bool) {
        isOpenInterestRect = isOpen
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        drawScanView()
        perform(#selector(ScanViewController.startScan), with: nil, afterDelay: 0.3)
    }

    @objc open func startScan() {
        if scanObj == nil {
            var cropRect = CGRect.zero
            if isOpenInterestRect {
                cropRect = ScanView.getScanRectWithPreView(preView: view, style: scanStyle!)
            }

            // 指定识别几种码
            if arrayCodeType == nil {
                arrayCodeType = [AVMetadataObject.ObjectType.qr as NSString,
                                 AVMetadataObject.ObjectType.ean13 as NSString,
                                 AVMetadataObject.ObjectType.code128 as NSString] as [AVMetadataObject.ObjectType]
            }

            scanObj = ScanWrapper(videoPreView: view,
                                     objType: arrayCodeType!,
                                     cropRect: cropRect,
                                     success: { [weak self] (arrayResult) -> Void in
                                        guard let strongSelf = self else {
                                            return
                                        }
                                        if !strongSelf.isSupportContinuous {
                                            // 停止扫描动画
                                            strongSelf.qRScanView?.stopScanAnimation()
                                        }
                                        strongSelf.handleCodeResult(arrayResult: arrayResult)
                                     })
        }
        
        scanObj?.supportContinuous = isSupportContinuous;

        // 结束相机等待提示
        qRScanView?.deviceStopReadying()

        // 开始扫描动画
        qRScanView?.startScanAnimation()

        // 相机运行
        scanObj?.start()
    }
    
    func restartScan() -> Void {
        
        print("restartScan")
        // 结束相机等待提示
        qRScanView?.deviceStopReadying()

        // 开始扫描动画
        qRScanView?.startScanAnimation()

        // 相机运行
        scanObj?.start()
    }
    
    open func drawScanView() {
        if qRScanView == nil {
            qRScanView = ScanView(frame: view.frame, vstyle: scanStyle!)
            view.addSubview(qRScanView!)
        }
        qRScanView?.deviceStartReadying(readyStr: readyString)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.restartScan()
        }
    }
   

    /**
     处理扫码结果，如果是继承本控制器的，可以重写该方法,作出相应地处理，或者设置delegate作出相应处理
     */
    open func handleCodeResult(arrayResult: [ScanResult]) {
        
       print("扫码结果 \(arrayResult)")
       
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        NSObject.cancelPreviousPerformRequests(withTarget: self)
        qRScanView?.stopScanAnimation()
        scanObj?.stop()
    }
    
}

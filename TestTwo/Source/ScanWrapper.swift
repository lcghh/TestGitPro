//
//  LBXScanWrapper.swift
//  swiftScan
//
//  Created by lbxia on 15/12/10.
//  Copyright © 2015年 xialibing. All rights reserved.
//

import UIKit
import AVFoundation

public struct ScanResult {
    
    /// 码内容
    public var strScanned: String?
    
    /// 码的类型
    public var strBarCodeType: String?

    public init(str: String?, barCodeType: String?) {
        strScanned = str
        strBarCodeType = barCodeType
    }
}



open class ScanWrapper: NSObject,AVCaptureMetadataOutputObjectsDelegate {
    
    let device = AVCaptureDevice.default(for: AVMediaType.video)
    var input: AVCaptureDeviceInput?
    var output: AVCaptureMetadataOutput

    let session = AVCaptureSession()
    var previewLayer: AVCaptureVideoPreviewLayer?

    // 存储返回结果
    var arrayResult = [ScanResult]()

    // 扫码结果返回block
    var successBlock: ([ScanResult]) -> Void
    
    //连续扫码
    var supportContinuous = false
    
    
    /**
     初始化设备
     - parameter videoPreView: 视频显示UIView
     - parameter objType:      识别码的类型,缺省值 QR二维码
     - parameter cropRect:     识别区域
     - parameter success:      返回识别信息
     - returns:
     */
    init(videoPreView: UIView,
         objType: [AVMetadataObject.ObjectType] = [(AVMetadataObject.ObjectType.qr as NSString) as AVMetadataObject.ObjectType],
         cropRect: CGRect = .zero,
         success: @escaping (([ScanResult]) -> Void)) {
        
        
        
        successBlock = success
        output = AVCaptureMetadataOutput()
        
        super.init()
        
        guard let device = device else {
            return
        }
        // 聚焦模式
        try! device.lockForConfiguration()
        if device.isFocusModeSupported(AVCaptureDevice.FocusMode.autoFocus) == true {
            device.focusMode = .autoFocus
        }
        do {
            input = try AVCaptureDeviceInput(device: device)
        } catch let error as NSError {
            print("AVCaptureDeviceInput(): \(error)")
        }
        guard let input = input else {
            return
        }
        
        
        if session.canAddInput(input) {
            session.addInput(input)
        }

        if session.canAddOutput(output) {
            session.addOutput(output)
        }

        session.sessionPreset = AVCaptureSession.Preset.high

        // 参数设置
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)

        output.metadataObjectTypes = objType

        //        output.metadataObjectTypes = [AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code]

        if !cropRect.equalTo(CGRect.zero) {
            // 启动相机后，直接修改该参数无效
            output.rectOfInterest = cropRect
        }

        device.unlockForConfiguration()
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill

        var frame: CGRect = videoPreView.frame
        frame.origin = CGPoint.zero
        previewLayer?.frame = frame

        videoPreView.layer.insertSublayer(previewLayer!, at: 0)

        if device.isFocusPointOfInterestSupported && device.isFocusModeSupported(.continuousAutoFocus) {
            do {
                try input.device.lockForConfiguration()
                input.device.focusMode = AVCaptureDevice.FocusMode.continuousAutoFocus
                input.device.unlockForConfiguration()
            } catch let error as NSError {
                print("device.lockForConfiguration(): \(error)")
            }
        }
    }

    public func metadataOutput(_ output: AVCaptureMetadataOutput,
                               didOutput metadataObjects: [AVMetadataObject],
                               from connection: AVCaptureConnection) {
        captureOutput(output, didOutputMetadataObjects: metadataObjects, from: connection)
    }
    
    func start() {
        print("start ======================")
        if !session.isRunning {
            print("start ======================")
            session.startRunning()
        }
    }
    
    func stop() {
        if session.isRunning {
            session.stopRunning()
        }
    }
    
    func focusAtPoint(point:CGPoint) -> Void {
        do {
            try device?.lockForConfiguration()
            if device!.isFocusModeSupported(.autoFocus) {
                device?.focusPointOfInterest = point
                device?.focusMode = .autoFocus
            }
            device?.unlockForConfiguration()
        } catch _ {
            print("lockForConfiguration  fail")
        }
    }
    
    open func captureOutput(_ captureOutput: AVCaptureOutput,
                            didOutputMetadataObjects metadataObjects: [Any],
                            from connection: AVCaptureConnection!) {
        

        arrayResult.removeAll()

        // 识别扫码类型
        for current in metadataObjects {
            guard let code = current as? AVMetadataMachineReadableCodeObject else {
                continue
            }
            
            #if !targetEnvironment(simulator)
            
            arrayResult.append(ScanResult(str: code.stringValue,
                                             barCodeType: code.type.rawValue
                                            ))
            #endif
        }

        if !arrayResult.isEmpty {
            stop()
            successBlock(arrayResult)
        }
    }
    
    open func connectionWithMediaType(mediaType: AVMediaType, connections: [AnyObject]) -> AVCaptureConnection? {
        for connection in connections {
            guard let connectionTmp = connection as? AVCaptureConnection else {
                continue
            }
            for port in connectionTmp.inputPorts where port.mediaType == mediaType {
                return connectionTmp
            }
        }
        return nil
    }

   
}

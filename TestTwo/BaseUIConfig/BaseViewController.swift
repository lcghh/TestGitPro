//
//  BaseViewController.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/30.
//

import UIKit
import SnapKit
import Toast_Swift

class BaseViewController: UIViewController {
    
//    lazy var button:UIButton? = {
//
//        let button = UIButton(type: .custom)
//        button.setTitle("jump", for: .normal)
//        button.setTitleColor(UIColor.red, for: .normal)
//        button.backgroundColor = UIColor.blue
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
//        button.addTarget(self, action:#selector(BaseViewController.jumpToNextVC), for: .touchUpInside)
//        return button
//    }()
//
//    func addSubviews() -> Void {
//        view.addSubview(button ?? UIView())
//    }
//
//    func defineLayout() -> Void {
//        button?.snp.makeConstraints({ make in
//            make.center.equalTo(view)
//            make.width.equalTo(120)
//            make.height.equalTo(44)
//        })
//    }
//
//    @objc func jumpToNextVC() -> Void {
//        navigationController?.pushViewController(BaseViewController(), animated: true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white;
//        addSubviews()
//        defineLayout()
        // Do any additional setup after loading the view.
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
//        self.view.makeToastActivity(.center)
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
//            self.view.hideToastActivity()
//        }
        
        ToastManager.shared.isTapToDismissEnabled = false;
        let showView = UIView.init()
//        showView.center = self.view.center
        showView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        showView.backgroundColor = UIColor(white: 0.0, alpha: 0.4)
//        showView.layer.cornerRadius = 100
//        showView.clipsToBounds = true
        
        let button = UIButton(type: .custom)
        button.setTitle("test toast", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.center = showView.center;
        button.frame = CGRect(x: 200, y: 200, width: 200, height: 200)
        button.addTarget(self, action: #selector(testToast), for: .touchUpInside)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        
        showView.addSubview(button)
        
//        self.view.showToast(showView, point: self.view.center)
//        self.view.showToast(showView, duration: TimeInterval(60*60*24*360), point: self.view.center) { didTap in
//            
//        }
//        
        
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
//            self.view.hideAllToasts()
//        }
        
    }
    
    @objc func testToast() -> Void {
        print("handle something")
        self.view.hideAllToasts()
    }
    

}

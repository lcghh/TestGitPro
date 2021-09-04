//
//  BaseViewController.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/30.
//

import UIKit
import SnapKit

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
    

    

}

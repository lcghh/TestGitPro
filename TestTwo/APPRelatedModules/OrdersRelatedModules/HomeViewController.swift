//
//  HomeViewController.swift
//  TestTwo
//
//  Created by lichao on 2021/9/5.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var orders:OrdersStatusViewController = {
        
        let orders = OrdersStatusViewController()
        return orders
    }()
    
    lazy var topView:UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "订单页"
        self.addChild(orders)
        orders.didMove(toParent: self)
        self.view .addSubview(orders.view)
        orders.view.snp.makeConstraints { maker in
            maker.left.right.bottom.equalTo(self.view)
            maker.top.equalTo(self.view).offset(60)
        }
        self.view.addSubview(self.topView)
        self.topView.snp.makeConstraints { make in
            make.left.top.right.equalTo(self.view)
            make.bottom.equalTo(orders.view.snp.top)
        }
    }
    

   

}

//
//  OrdersStatusViewController.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/30.
//

import UIKit

class OrdersStatusViewController: BasePageViewController {
    
    override init() {
        super.init()
        let vc1 = UIViewController()
        vc1.view.backgroundColor = UIColor(red: 251/255, green: 252/255, blue: 149/255, alpha: 1.0)
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor(red: 252/255, green: 150/255, blue: 149/255, alpha: 1.0)
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor(red: 149/255, green: 218/255, blue: 252/255, alpha: 1.0)
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor(red: 149/255, green: 252/255, blue: 197/255, alpha: 1.0)
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor(red: 252/255, green: 182/255, blue: 106/255, alpha: 1.0)
        tabItems = [(vc1, "Mon."), (vc2, "Tue."), (vc3, "Wed."), (vc4, "Thu."), (vc5, "Fri.")]
        isInfinity = true

    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

   

}

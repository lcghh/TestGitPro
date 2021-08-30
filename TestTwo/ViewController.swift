//
//  ViewController.swift
//  TestTwo
//
//  Created by lichao on 2021/8/28.
//

import UIKit
import SnapKit

class ViewController: BaseViewController {

    lazy var tableView:UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white;
        addSubviews()
        defineLayout()
    }
    
    
    func addSubviews() -> Void {
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBelowListData()
    }
    func defineLayout() -> Void {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
    }
    @objc func jumpToNextVC() -> Void {
        navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    // 列表数据
    private func loadBelowListData() -> Void {
        // 首页列表数据
        NetWorkRequest(.homePageBelowConten(parameters: ["page":1]),isCarch: true,carchID: "page-\(1)" as NSString, completion: { (responseString) -> (Void) in
            // 轮播图数据
           
                print(responseString)
            
        }, failed: { (failedResutl) -> (Void) in
            print("服务器返回code不为0000啦~\(failedResutl)")
        }, errorResult: { () -> (Void) in
            print("网络异常")
        })
    }

}
extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        jumpToNextVC()
    }
}
extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = UIColor(white: CGFloat(arc4random() % 255) / 255.0, alpha: 1.0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}


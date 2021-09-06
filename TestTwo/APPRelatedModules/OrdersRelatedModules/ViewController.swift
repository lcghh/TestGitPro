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
        configLoadMore()
    }
    
    func configLoadMore() -> Void {
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)

        //Header
        let header = DefaultRefreshHeader.header()
//        header.setText("Pull to refresh", mode: .pullToRefresh)
//        header.setText("Release to refresh", mode: .releaseToRefresh)
//        header.setText("Success", mode: .refreshSuccess)
//        header.setText("Refreshing...", mode: .refreshing)
//        header.setText("Failed", mode: .refreshFailure)
//        header.tintColor = UIColor.orange
//        header.imageRenderingWithTintColor = true
//        header.durationWhenHide = 0.4
        self.tableView.configRefreshHeader(with: header,container:self) { [weak self] in
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                guard let vc = self else{
                    return;
                }
                vc.tableView.reloadData()
                vc.tableView.switchRefreshHeader(to: .normal(.success, 0.3))
            }

        };
        let footer = DefaultRefreshFooter.footer()
        // 需要自定义的时候，可以改这些属性
//        footer.setText("Pull up to refresh", mode: .pullToRefresh)
//        footer.setText("No data any more", mode: .noMoreData)
//        footer.setText("Refreshing...", mode: .refreshing)
//        footer.setText("Tap to load more", mode: .tapToRefresh)
//        footer.textLabel.textColor  = UIColor.orange
        footer.refreshMode = .scrollAndTap
        self.tableView.configRefreshFooter(with: footer,container:self) { [weak self] in
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                guard let vc = self else{
                    return;
                }
                vc.tableView.reloadData()
//                vc.tableView.switchRefreshFooter(to: .removed)
               
                vc.tableView.switchRefreshFooter(to: .noMoreData)
            }
           
        }
    }
    
    
    func addSubviews() -> Void {
        view.addSubview(tableView)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        loadBelowListData()
        
//        getYSBProductDetail()
        
        do {
//            try testJsonToModel()
//            try testResponceDataToModel()
            try testPropertyWrapper()
        } catch _ {
            print("解析失败")
        }
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
    
    private func loadSlidesListData() {
        // 首页列表数据
        NetWorkRequest(.homeGoodsList(parameters: ["lon":"116.47118377685547","lat":"39.91233444213867"]),isCarch: true, completion: { (responseString) -> (Void) in
            // 轮播图数据
            print("请求成功")

        }, failed: { (failedResutl) -> (Void) in
            print("服务器返回code不为0000啦~\(failedResutl)")
        }, errorResult: { () -> (Void) in
            print("网络异常")
        })

    }
    
    func getYSBProductDetail() -> Void {
        YSBNetWorkRequest(.YSBGoodDetail(parameters: [:])) { data in
            if data.length > 0 {
            }
            
            
        } failed: { failreult in
            
        } errorResult: {
            
        }
        
    
    }
    
    func testJsonToModel() throws -> Void {
        
//        let student = Student(name: "wahahahaha", grace: "18年级")
        
        let array = [Student(name: "wahahahaha", grace: "18年级"),
                     Student(name: "wahahahaha", grace: "16年级"),
                     Student(name: "wahahahaha", grace: "15年级"),
                     Student(name: "wahahahaha", grace: "14年级")]
        
//        let encoder = JSONEncoder()
//        encoder.outputFormatting = .prettyPrinted
//
//        let data = try encoder.encode(array)
//
//        let arrayModels = try getArrayModels(from: data, modelType: Student.self)
//
//
//        print(arrayModels)
//
    }
    
    func testResponceDataToModel() throws -> Void {
        
        let array = [Student(name: "wahahahaha", grace: "18年级"),
                     Student(name: "wahahahaha", grace: "16年级"),
                     Student(name: "wahahahaha", grace: "15年级"),
                     Student(name: "wahahahaha", grace: "14年级")]
        let responceResult = Result(code: 40001, data: array, message: "good for you")
        
//        let encoder = JSONEncoder()
//        let data = try encoder.encode(responceResult)
//
//        print(String(data: data, encoding: .utf8))
//
//        let result = convertResponceData(with: data, modelType: [Student].self)
//
//        print(result ?? "none value")
        
    }
    
    func testPropertyWrapper() -> Void {
        let str = "{\"message\":\"good for you\",\"data\":[{\"name\":\"test----1\"},{\"name\":\"whatHow\",\"grace\":null},{\"name\":\"dame\",\"grace\":\"15年级\"},{\"name\":\"good\",\"grace\":\"14年级\"}],\"code\":40001}"
        
        let data = str.data(using: .utf8)!
        
        let result = convertResponceData(with: data, modelType: [Student].self)
        
        print(result!)
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


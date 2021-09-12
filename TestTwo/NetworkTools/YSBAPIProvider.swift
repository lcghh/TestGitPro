//
//  YSBAPIProvider.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/31.
//

import Foundation
import Moya


enum YSBAPI {
//    case homeGoodsList(parameters:[String:Any]) // 首页上面列表
//    case homePageBelowConten(parameters:[String:Any]) // 首页下面列表
    case YSBGoodDetail(parameters:[String:Any]) // 商品详情
    case loadPDF(url:String) //商品类别信息
//    case goodCategory(parameters:[String:Any]) //商品类别信息
//    case categoryGoodsList(parameters:[String:Any]) //商品列表

}


// 遵循 TargetType 代理 实现方法
extension YSBAPI: TargetType {
    //服务器地址
    public var baseURL: URL {
        switch self {
        case .loadPDF(let url):
            return URL(string: url)!
        default:
            break
        }
         return URL(string: currentDomain())!
    }


    var path: String {
        switch self {
//            case .homeGoodsList: return "wxmini/homePageContent"
//            case .homePageBelowConten: return "wxmini/homePageBelowConten"
            case .YSBGoodDetail: return "wholesale-drug/sales/disconveryMore/v4380"
        case .loadPDF(let _): return ""
//            case .goodCategory: return "wxmini/getCategory"
//            case .categoryGoodsList: return "wxmini/getMallGoods"
        }
    }

    var method: Moya.Method {
        switch self {
        case .loadPDF:
            return .get
        default:
            break
        }
        return .post
    }
    
    
    var task: Task {
        var parmeters:[String:Any] = [:]
        switch self {
        case .loadPDF:
            return .downloadDestination(DefaultDownloadDestination)
        case .YSBGoodDetail((let parameters)):
            parmeters = parameters

        }
        
        return .requestCompositeParameters(bodyParameters: parmeters, bodyEncoding: JSONEncoding.default, urlParameters: [:])
       
    }
    
    var sampleData: Data {
        
        return "".data(using: String.Encoding.utf8)!
        
    }
    var headers: [String : String]? { return [
                                              "Content-type": "application/json"
                                              ] }

    //是否显示转圈提示
    var show: Bool {
        return self.show
    }
    
}

//定义下载的DownloadDestination（不改变文件名，同名文件不会覆盖）
private let DefaultDownloadDestination: DownloadDestination = { temporaryURL, response in
    let index = arc4random() % 1000
    
    return (DefaultDownloadDir.appendingPathComponent("\(index)_\(response.suggestedFilename!)"), [])
}

//默认下载保存地址（用户文档目录）
let DefaultDownloadDir: URL = {
    let directoryURLs = FileManager.default.urls(for: .documentDirectory,
                                                 in: .userDomainMask)
    
    NSHomeDirectory()
    
    print(directoryURLs.first)
    return directoryURLs.first!
}()


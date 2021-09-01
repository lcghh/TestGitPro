//
//  YSBAPIProvider.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/31.
//

import Foundation
import Moya

// 首页接口
let YSBAPIProvider = MoyaProvider<YSBAPI>()


enum YSBAPI {
//    case homeGoodsList(parameters:[String:Any]) // 首页上面列表
//    case homePageBelowConten(parameters:[String:Any]) // 首页下面列表
    case YSBGoodDetail(parameters:[String:Any]) // 商品详情
//    case goodCategory(parameters:[String:Any]) //商品类别信息
//    case categoryGoodsList(parameters:[String:Any]) //商品列表

}


// 遵循 TargetType 代理 实现方法
extension YSBAPI: TargetType {
    //服务器地址
    public var baseURL: URL {
         return URL(string: "https://test.ysbang.cn/")!
    }

    var path: String {
        switch self {
//            case .homeGoodsList: return "wxmini/homePageContent"
//            case .homePageBelowConten: return "wxmini/homePageBelowConten"
            case .YSBGoodDetail: return "wholesale-drug/sales/disconveryMore/v4380"
//            case .goodCategory: return "wxmini/getCategory"
//            case .categoryGoodsList: return "wxmini/getMallGoods"
        }
    }

    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        var parmeters:[String:Any] = [:]
        switch self {
//        case .homeGoodsList(let parameters):
//            parmeters = parameters
//        case .homePageBelowConten(let parameters):
//            parmeters = parameters
        case .YSBGoodDetail((let parameters)):
            parmeters = parameters
//        case .goodCategory(let parameters):
//            parmeters = parameters
//        case .categoryGoodsList(let parameters):
//            parmeters = parameters
        }
        
        return .requestCompositeParameters(bodyParameters: parmeters, bodyEncoding: JSONEncoding.default, urlParameters: [:])
       
    }
    
    //字典转Data
    private func jsonToData(jsonDic:Dictionary<String, Any>) -> Data? {
        if (!JSONSerialization.isValidJSONObject(jsonDic)) {
            print("is not a valid json object")
            return nil
        }
        //利用自带的json库转换成Data
        //如果设置options为JSONSerialization.WritingOptions.prettyPrinted，则打印格式更好阅读
        let data = try? JSONSerialization.data(withJSONObject: jsonDic, options: [])
        //Data转换成String打印输出
        let str = String(data:data!, encoding: String.Encoding.utf8)
        //输出json字符串
        print("Json Str:\(str!)")
        return data
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

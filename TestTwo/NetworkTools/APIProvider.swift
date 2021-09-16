//
//  APIProvider.swift
//  TestTwo
//
//  Created by YSB-lc on 2021/8/30.
//

import Foundation
import Moya
import Alamofire

enum API {
    case homeGoodsList(parameters:[String:Any]) // 首页上面列表
    case homePageBelowConten(parameters:[String:Any]) // 首页下面列表
    case goodDetail(parameters:[String:Any]) // 商品详情
    case goodCategory(parameters:[String:Any]) //商品类别信息
    case categoryGoodsList(parameters:[String:Any]) //商品列表

}

var isJailbroken: Bool {
    return jailbreakFileExists
        || sandboxBreached
        || evidenceOfSymbolLinking
}

private var evidenceOfSymbolLinking: Bool {
    var s = stat()
    guard lstat("/Applications", &s) == 0 else { return false }
    return (s.st_mode & S_IFLNK == S_IFLNK)
}

private var sandboxBreached: Bool {
    guard (try? " ".write(
        toFile: "/private/jailbreak.txt",
        atomically: true, encoding: .utf8)) == nil else {
            return true
    }
    return false
}

private var jailbreakFileExists: Bool {
    let jailbreakFilePaths = [
        "/Applications/Cydia.app",
        "/Library/MobileSubstrate/MobileSubstrate.dylib",
        "/bin/bash",
        "/usr/sbin/sshd",
        "/etc/apt",
        "/private/var/lib/apt/"
    ]
    let fileManager = FileManager.default
    return jailbreakFilePaths.contains { path in
        if fileManager.fileExists(atPath: path) {
            return true
        }
        if let file = fopen(path, "r") {
            fclose(file)
            return true
        }
        return false
    }
}


// 遵循 TargetType 代理 实现方法
extension API: TargetType {
    //服务器地址
    public var baseURL: URL {
         return URL(string: "https://wxmini.baixingliangfan.cn/baixing/")!
    }

    var path: String {
        switch self {
            case .homeGoodsList: return "wxmini/homePageContent"
            case .homePageBelowConten: return "wxmini/homePageBelowConten"
            case .goodDetail: return "wxmini/getGoodDetailById"
            case .goodCategory: return "wxmini/getCategory"
            case .categoryGoodsList: return "wxmini/getMallGoods"
        }
    }

    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        
        var paramsDict:[String:Any] = ["platform":"iOS"]
        paramsDict["version"] = Bundle.main.infoDictionary!["CFBundleShortVersionString"]
        paramsDict["osVersion"] = UIDevice.current.systemVersion
        paramsDict["ueDeviceId"] = ""
        paramsDict["iJ"] = isJailbroken ? 1 : 0 // 是否越狱
        paramsDict["currentPath"] = "" // 当前页
        paramsDict["invokePath"] = "" // 上一页
        paramsDict["ueLat"] = "" // 经度
        paramsDict["ueLon"] = "" // 纬度
        paramsDict["iW"] = "" // 网络连接类型
        
        
        
        var parmeters:[String:Any] = [:]
        switch self {
        case .homeGoodsList(let parameters):
            parmeters = parameters
        case .homePageBelowConten(let parameters):
            parmeters = parameters
        case .goodDetail((let parameters)):
            parmeters = parameters
        case .goodCategory(let parameters):
            parmeters = parameters
        case .categoryGoodsList(let parameters):
            parmeters = parameters
        }
        
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    
    
    
    var sampleData: Data {
        
        return "".data(using: String.Encoding.utf8)!
        
    }
    var headers: [String : String]? { return nil }

    //是否显示转圈提示
    var show: Bool {
        return self.show
    }
    
}



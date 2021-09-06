//
//  BaseJsonToObjectTool.swift
//  TestTwo
//
//  Created by lichao on 2021/9/1.
//

import Foundation

private let decoder = JSONDecoder()

//func getArrayModels<T:Codable>(from data:Data,modelType: T.Type?) -> [T]? {
//    
//    do {
//        let jsonData = try JSON(data: data)
//
//        print(jsonData)
//        
//        if jsonData.arrayObject != nil { // 数组转model
//            
//            do {
////                let modelsArray = try decoder.decode([T].self, from: jsonData.rawData(options: .fragmentsAllowed))
//                let modelsArray = try decoder.decode([T].self, from: data)
//               return modelsArray
//            } catch _ {
//                return nil
//            }
//            
//        }
//    } catch _ {
//        
//    }
//    return nil
//}

func convertResponceData<T:Decodable>(with data:Data,modelType:T.Type) -> Result<T>? {
    
    do {
        let model:Result<T>? = try decoder.decode(Result<T>.self, from: data)
        return model
    } catch _ {
        return nil
    }
//    return nil
}

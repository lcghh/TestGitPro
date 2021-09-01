//
//  BaseJsonToObjectTool.swift
//  TestTwo
//
//  Created by lichao on 2021/9/1.
//

import Foundation
import SwiftyJSON


func getArrayModels<T:Codable>(from data:Data,modelType: T.Type?) -> [T]? {
    
    do {
        let jsonData = try JSON(data: data)

        print(jsonData)
        
        if jsonData.arrayObject != nil { // 数组转model
            
            do {
//                let modelsArray = try decoder.decode([T].self, from: jsonData.rawData(options: .fragmentsAllowed))
                let modelsArray = try decoder.decode([T].self, from: data)
               return modelsArray
            } catch _ {
                return nil
            }
            
        }
    } catch _ {
        
    }
    return nil
}

//
//  DataToModelTool.swift
//  TestTwo
//
//  Created by lichao on 2021/9/1.
//

import Foundation

public struct Student : Decodable {
    var name:String
    @Default<String> var grace:String
    
}

public struct Result<T:Decodable> : Decodable{
    var code:Int
    var data:T?
    var message:String
}

protocol DefaultValue {
    associatedtype Value: Decodable
    static var defaultValue: Value { get }
}


@propertyWrapper
struct Default<T:DefaultValue> {
    
    var wrappedValue:T.Value
    
}
extension Default: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.Value.self)) ?? T.defaultValue
    }
}

extension KeyedDecodingContainer {
    func decode<T>(_ type: Default<T>.Type, forKey key: Key) throws -> Default<T> where T: DefaultValue {
        //判断 key 缺失的情况，提供默认值
        (try decodeIfPresent(type, forKey: key)) ?? Default(wrappedValue: T.defaultValue)
    }
}

//  不同的基础 类型设置不同的默认值
extension Int: DefaultValue {
    static var defaultValue = -1
}
extension String: DefaultValue {
    static var defaultValue = "default value for test"
}

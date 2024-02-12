//  DictionaryExtention.swift
//  Demo_LRF_Settings
//
//  Created by i-Phone on 7/6/19.
//  Copyright © 2019 i-Phone. All rights reserved.
//

import Foundation

extension Dictionary where Key == String
{
    
    func getDoubleValue(key: String) -> Double{
        
        if let any: Any = self[key] as Any?{
            if let number = any as? NSNumber{
                return number.doubleValue
            }else if let str = any as? NSString{
                return str.doubleValue
            }
        }
        return -1
    }
    
    func getIntValue(key: String) -> Int{
        
        if let any: Any = self[key] as Any?{
            if let number = any as? NSNumber{
                return number.intValue
            }else if let str = any as? NSString{
                return str.integerValue
            }
        }
        return -1
    }
    
    
    func getStringValue(key: String) -> String{
        
        if let any: Any = self[key] as Any?{
            if let number = any as? NSNumber{
                return number.stringValue
            }else if let str = any as? String{
                return str
            }
        }
        return ""
    }
    
    func getBooleanValue(key: String) -> Bool {
        
        if let any: Any = self[key] as Any?{
            if let num = any as? NSNumber {
                return num.boolValue
            } else if let str = any as? NSString {
                return str.boolValue
            }
        }
        return false
    }
    
    func getStringArrayValue(key: String) -> [String]{
        
        if let any: Any = self[key] as Any?{
            if let ary = any as? [String] {
                return ary
            }
        }
        return []
    }
    
    func getStringDictionaryValue(key : String) -> NSDictionary {
        if let any: Any = self[key] as Any?{
            if let ary = any as? NSDictionary {
                return ary
            }
        }
        return [:]
    }
    
    func getArrayValue(key : String) -> NSMutableArray {
        if let any: Any = self[key] as Any?{
            if let ary = any as? NSMutableArray {
                return ary
            }
        }
        return []
    }
    
    func getArrayDictionary(key : String) -> [[String : Any]] {
        if let any: Any = self[key] as Any?{
            if let ary = any as? [[String : Any]] {
                return ary
            }
        }
        return [[:]]
    }
}

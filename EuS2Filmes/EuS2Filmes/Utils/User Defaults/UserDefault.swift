//
//  UserDefault.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 18/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class UserDefault: NSObject
{
    private static let defaults = UserDefaults.standard
    
    
    static func setValue(key: String, value: Any)
    {
        print(key + " ")
        print(value)
        defaults.set(value, forKey: key)
    }
    
    
    static func getValue(key: String) -> Any?
    {
        return defaults.value(forKey: key)
    }
    
    
    static func removeObject(key: String)
    {
        defaults.removeObject(forKey: key)
    }
}

//
//  SpokenLanguage.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class SpokenLanguage: NSObject
{
    var iso639_1: String
    var name: String
    
    override init()
    {
        iso639_1 = ""
        name = ""
    }
    
    required init(dataJSON: JSON)
    {
        iso639_1 = dataJSON["iso_639_1"].stringValue
        name = dataJSON["name"].stringValue
    }
}

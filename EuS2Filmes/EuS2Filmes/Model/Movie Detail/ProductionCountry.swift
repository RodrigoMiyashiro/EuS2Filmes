//
//  ProductionCountry.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductionCountry: NSObject
{
    var iso3166_1: String
    var name: String
    
    override init()
    {
        iso3166_1 = ""
        name = ""
    }
    
    required init(dataJSON: JSON)
    {
        iso3166_1 = dataJSON["iso_3166_1"].stringValue
        name = dataJSON["name"].stringValue
    }
}

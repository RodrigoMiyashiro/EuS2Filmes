//
//  Genre.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 21/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Genre: NSObject
{
    var id: Int
    var name: String
    
    override init()
    {
        id = 0
        name = ""
    }
    
    required init(dataJSON: JSON)
    {
        id = dataJSON["id"].intValue
        name = dataJSON["name"].stringValue
    }
}

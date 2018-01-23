//
//  BelongsToCollection.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class BelongsToCollection: NSObject
{
    var id: Int
    var name: String
    var posterPath: String
    var backdropPath: String
    
    override init()
    {
        id = 0
        name = ""
        posterPath = ""
        backdropPath = ""
    }
    
    required init(dataJSON: JSON)
    {
        id = dataJSON["id"].intValue
        name = dataJSON["name"].stringValue
        posterPath = dataJSON["poster_path"].stringValue
        backdropPath = dataJSON["backdrop_path"].stringValue
    }
}

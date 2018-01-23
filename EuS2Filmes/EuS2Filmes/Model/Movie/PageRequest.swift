//
//  RequestPage.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 22/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class PageRequest: NSObject
{
    var id: Int
    var page: Int
    var totalPage: Int
    var totalResults: Int
    
    override init()
    {
        id = 0
        page = 0
        totalPage = 0
        totalResults = 0
    }
    
    required init(dataJSON: JSON)
    {
        id = 0
        page = 0
        totalPage = 0
        totalResults = 0
    }
}

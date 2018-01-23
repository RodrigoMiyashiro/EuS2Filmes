//
//  ListMovie.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 22/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListMovie: NSObject, ListControl
{
    var pageRequest: PageRequest
    var movies: [Movie]
    
    override init()
    {
        pageRequest = PageRequest()
        movies = [Movie]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        pageRequest = PageRequest(dataJSON: dataJSON)
        parseJSON(arrayJson: dataJSON["results"].arrayValue)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        for json in arrayJson
        {
            let movie = Movie(dataJSON: json)
            self.movies.append(movie)
        }
    }
}

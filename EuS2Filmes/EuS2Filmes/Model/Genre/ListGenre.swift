//
//  ListElements.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 21/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListGenre: NSObject, ListControl
{
    var genres: [Genre]
    
    override init()
    {
        genres = [Genre]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        parseJSON(arrayJson: dataJSON["genres"].arrayValue)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        self.genres = [Genre]()
        for json in arrayJson
        {
            let genre = Genre(dataJSON: json)
            self.genres.append(genre)
        }
    }
    
    static func getGenresID(intJSON: [JSON]) -> [Int]
    {
        var list = [Int]()
        for element in intJSON
        {
            let newID = element.intValue
            list.append(newID)
        }
        
        return list
    }
    
}

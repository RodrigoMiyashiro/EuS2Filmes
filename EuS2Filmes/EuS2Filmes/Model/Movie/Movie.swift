//
//  Movie.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 22/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie: NSObject
{
    var isAdult: Bool
    var backdropPath: String
    var genresID: [Int]
    var id: Int
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var releaseDate: String
    var posterPath: String
    var popularity: Double
    var title: String
    var isVideo: Bool
    var voteAverage: Float
    var voteCount: Int
    
    override init()
    {
        isAdult = false
        backdropPath = ""
        genresID = [Int]()
        id = 0
        originalLanguage = ""
        originalTitle = ""
        overview = ""
        releaseDate = ""
        posterPath = ""
        popularity = 0
        title = ""
        isVideo = false
        voteAverage = 0
        voteCount = 0
    }
    
    required init(dataJSON: JSON)
    {
        isAdult = dataJSON["adult"].boolValue
        backdropPath = dataJSON["backdrop_paht"].stringValue
        genresID = ListGenre.getGenresID(intJSON: dataJSON["genre_ids"].arrayValue)
        id = dataJSON["id"].intValue
        originalLanguage = dataJSON["original_language"].stringValue
        originalTitle = dataJSON["original_title"].stringValue
        overview = dataJSON["overview"].stringValue
        releaseDate = dataJSON["release_date"].stringValue
        posterPath = dataJSON["poster_path"].stringValue
        popularity = dataJSON["popularity"].doubleValue
        title = dataJSON["title"].stringValue
        isVideo = dataJSON["video"].boolValue
        voteAverage = dataJSON["vote_average"].floatValue
        voteCount = dataJSON["vote_count"].intValue
    }
    
    
}

//
//  MovieDetail.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class MovieDetail: Movie
{
    var belongsToCollection: BelongsToCollection
    var budget: Double
    var genres: ListGenre
    var homepage: String
    var imdbID: String
    var productionCompanies: ListProductionCompany
    var revenue: Double
    var runtime: Int
    var spokenLanguage: ListSpokenLanguage
    var productionCountries: ListProductionCountry
    var status: String
    var tagline: String
    
    override init()
    {
         belongsToCollection = BelongsToCollection()
         budget = 0
         genres = ListGenre()
         homepage = ""
         imdbID = ""
         productionCompanies = ListProductionCompany()
         revenue = 0
         runtime = 0
         spokenLanguage = ListSpokenLanguage()
         productionCountries = ListProductionCountry()
         status = ""
         tagline = ""
        
        super.init()
    }
    
    required init(dataJSON: JSON)
    {
        belongsToCollection = BelongsToCollection(dataJSON: dataJSON["belongs_to_collection"])
        budget = dataJSON["budget"].doubleValue
        genres = ListGenre(dataJSON: dataJSON["genres"])
        homepage = dataJSON["homepage"].stringValue
        imdbID = dataJSON["imdb_id"].stringValue
        productionCompanies = ListProductionCompany(dataJSON: dataJSON["production_companies"])
        revenue = dataJSON["revenue"].doubleValue
        runtime = dataJSON["runtime"].intValue
        spokenLanguage = ListSpokenLanguage(dataJSON: dataJSON["spoken_languages"])
        productionCountries = ListProductionCountry(dataJSON: dataJSON["production_countries"])
        status = dataJSON["status"].stringValue
        tagline = dataJSON["tagline"].stringValue
        
        super.init(dataJSON: dataJSON)
    }
}


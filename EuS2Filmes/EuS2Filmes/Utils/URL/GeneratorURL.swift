//
//  GeneratorURL.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 18/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

/* https://api.themoviedb.org/3/authentication/token/new?api_key=4b17b0aeeaabf430b4b5708bedc4f72b */
/* https://api.themoviedb.org/3/authentication/guest_session/new?api_key=4b17b0aeeaabf430b4b5708bedc4f72b */
/* https://api.themoviedb.org/3/genre/movie/list?api_key=4b17b0aeeaabf430b4b5708bedc4f72b&language=pt-BR */
/* https://api.themoviedb.org/3/genre/28/movies?api_key=4b17b0aeeaabf430b4b5708bedc4f72b&language=pt-BR&include_adult=false&sort_by=created_at.asc&page=1 */
// https://api.themoviedb.org/3/movie/353486?api_key=4b17b0aeeaabf430b4b5708bedc4f72b&language=pt-BR
// https://image.tmdb.org/t/p/w500/bXrZ5iHBEjH7WMidbUDQ0U2xbmr.jpg

struct GenerateURL
{
    static func get(type: TypeURL, genreID: String? = nil, movieID: String? = nil, page: Int? = nil, imgSize: String? = nil, imgURL: String? = nil) -> String
    {
        let token = MovieDB.apiKey.rawValue
        var url: String
        
        switch type
        {
        case .token:
            url = APIAccess.url.rawValue + APIExtensions.token.rawValue + KeyAPI.key.rawValue + token
            
        case .session:
            url = APIAccess.url.rawValue + APIExtensions.sessionGuest.rawValue + KeyAPI.key.rawValue + token
            
        case .genre:
            url = APIAccess.url.rawValue + ExtensionURL.genre.rawValue + ExtensionURL.movie.rawValue + ExtensionURL.list.rawValue + KeyAPI.key.rawValue + token + ComplementURL.language.rawValue
            
        case .movies:
            url = APIAccess.url.rawValue + ExtensionURL.genre.rawValue + "/" + genreID! + ExtensionURL.movies.rawValue + KeyAPI.key.rawValue + token + ComplementURL.language.rawValue + ComplementURL.includeAdult.rawValue + ComplementURL.sortBy.rawValue
            
        case .movieDetail:
            url = APIAccess.url.rawValue + ExtensionURL.movie.rawValue + "/" + movieID! + KeyAPI.key.rawValue + token + ComplementURL.language.rawValue
            
        case .image:
            url = ImgURL.img.rawValue + ExtensionImg.size.rawValue + imgSize! + imgURL!
        }
        
        return url
    }
}

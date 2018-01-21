//
//  EnumAPI.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 18/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import UIKit


enum TypeURL
{
    case token
    case session
    case genre
    case movies
    case movieDetail
    case image
}


enum APIAccess: String
{
    case url = "https://api.themoviedb.org/3/"
}


enum ImgURL: String
{
    case img = "https://image.tmdb.org/t/p/"
}


enum KeyAPI: String
{
    case key = "?api_key="
}

enum MovieDB: String
{
    case apiKey = "4b17b0aeeaabf430b4b5708bedc4f72b"
}

enum APIExtensions: String
{
    case token = "authentication/token/new"
    case sessionGuest = "authentication/guest_session/new"
}


enum ExtensionURL: String
{
    case genre = "/genre"
    case list = "/list"
    case movie = "/movie"
    case movies = "/movies"
}


enum ComplementURL: String
{
    case language = "&language=pt-BR"
    case includeAdult = "&include_adult=false"
    case sortBy = "&sort_by=created_at.asc"
    case page = "&page="
}


enum ExtensionImg: String
{
    case size = "/w"
}


enum UD: String
{
    case token
}

enum ErrorType
{
    case unknown
    case alamofire
}


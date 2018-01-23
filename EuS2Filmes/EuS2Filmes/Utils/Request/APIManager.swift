//
//  APIManager.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 18/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

// MARK: - Token Manager
class TokenManager: NSObject
{
    static func getToken(completion: @escaping(Token?, Error?) -> Void)
    {
        let url = GenerateURL.get(type: .token)
        
        Request.getFrom(url) { (result) in
            if let data = result as? Data
            {
                let token = Token(dataJSON: JSON(data))
                completion(token, nil)
            }
            else if let error = result as? Error
            {
                completion(nil, error)
            }
            else
            {
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}


// MARK: - Session Manager
class SessionManager: NSObject
{
    static func getSessionGuest(completion: @escaping(SessionGuest?, Error?) -> Void)
    {
        let url = GenerateURL.get(type: .session)
        
        Request.getFrom(url) { (result) in
            if let data = result as? Data
            {
                let session = SessionGuest(dataJSON: JSON(data))
                completion(session, nil)
            }
            else if let error = result as? Error
            {
                completion(nil, error)
            }
            else
            {
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}


// MARK: - Genre Manager
class GenreManager: NSObject
{
    static func getListGenres(completion: @escaping(ListGenre?, Error?) -> Void)
    {
        let url = GenerateURL.get(type: .genre)
        
        Request.getFrom(url) { (result) in
            if let data = result as? Data
            {
                let genres = ListGenre(dataJSON: JSON(data))
                completion(genres, nil)
            }
            else if let error = result as? Error
            {
                completion(nil, error)
            }
            else
            {
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}


// MARK: - Movie Manager
class MovieManager: NSObject
{
    static func getListMovies(byGenre: Int, currentPage: Int, completion: @escaping(ListMovie?, Error?) -> Void)
    {
        let url = GenerateURL.get(type: .movies, genreID: String(byGenre), page: currentPage)
        
        Request.getFrom(url) { (result) in
            if let data = result as? Data
            {
                let movies = ListMovie(dataJSON: JSON(data))
                completion(movies, nil)
            }
            else if let error = result as? Error
            {
                completion(nil, error)
            }
            else
            {
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
    
    static func getMovieDetail(movieID: Int, completion: @escaping(MovieDetail?, Error?) -> Void)
    {
        let url = GenerateURL.get(type: .movieDetail, movieID: String(movieID))
        
        Request.getFrom(url) { (result) in
            if let data = result as? Data
            {
                let movieDetail = MovieDetail(dataJSON: JSON(data))
                completion(movieDetail, nil)
            }
            else if let error = result as? Error
            {
                completion(nil, error)
            }
            else
            {
                completion(nil, ErrorManager.error(type: .unknown))
            }
        }
    }
}

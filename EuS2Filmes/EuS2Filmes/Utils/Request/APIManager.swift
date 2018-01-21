//
//  APIManager.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 18/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class APIManager: NSObject
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
    
    static func getListGenres(completion: (Any?) -> Void)
    {
        
    }
}

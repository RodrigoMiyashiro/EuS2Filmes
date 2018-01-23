//
//  StateAccess.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 21/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class StateAccess: NSObject
{
    var success: Bool
    var expiresAt: String
    
    override init()
    {
        success = false
        expiresAt = ""
    }
    
    required init(dataJSON: JSON)
    {
        success = dataJSON["sucess"].boolValue
        expiresAt = dataJSON["expires_at"].stringValue
    }
}

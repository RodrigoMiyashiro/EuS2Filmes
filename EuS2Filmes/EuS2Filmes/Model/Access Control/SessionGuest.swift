//
//  Session.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 21/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class SessionGuest: StateAccess
{
    var guestSessionID: String?
    
    override init()
    {
        super.init()
        guestSessionID = ""
    }
    
    required init(dataJSON: JSON)
    {
        super.init(dataJSON: dataJSON)
        guestSessionID = dataJSON["guest_session_id"].stringValue
    }
}

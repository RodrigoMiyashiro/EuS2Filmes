//
//  Token.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 21/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class Token: StateAccess
{    
    var requestToke: String?
    
    override init()
    {
        super.init()
        requestToke = ""
    }
    
    required init(dataJSON: JSON)
    {
        super.init(dataJSON: dataJSON)
        requestToke = dataJSON["request_token"].stringValue
    }
}

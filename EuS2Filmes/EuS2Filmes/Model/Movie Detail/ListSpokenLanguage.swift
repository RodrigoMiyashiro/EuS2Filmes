//
//  ListSpokenLanguage.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListSpokenLanguage: NSObject, ListControl
{
    var spokenLanguages: [SpokenLanguage]
    
    override init()
    {
        spokenLanguages = [SpokenLanguage]()
    }
    
    required convenience init(dataJSON: JSON)
    {
        self.init()
        parseJSON(arrayJson: dataJSON.arrayValue)
    }
    
    func parseJSON(arrayJson: [JSON])
    {
        for json in arrayJson
        {
            let spokenLanguage = SpokenLanguage(dataJSON: json)
            self.spokenLanguages.append(spokenLanguage)
        }
    }
}

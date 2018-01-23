//
//  ListProductionCountry.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListProductionCountry: NSObject, ListControl
{
    var productionCountries: [ProductionCountry]
    
    override init()
    {
        productionCountries = [ProductionCountry]()
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
            let newProductionCountry = ProductionCountry(dataJSON: json)
            self.productionCountries.append(newProductionCountry)
        }
    }
}

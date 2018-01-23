//
//  ListProductionCompany.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 23/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

class ListProductionCompany: NSObject, ListControl
{
    var productionCompanies: [ProductionCompany]
    
    override init()
    {
        productionCompanies = [ProductionCompany]()
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
            let productionCompany = ProductionCompany(dataJSON: json)
            self.productionCompanies.append(productionCompany)
        }
    }
}

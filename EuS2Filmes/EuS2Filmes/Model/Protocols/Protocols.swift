//
//  Protocols.swift
//  EuS2Filmes
//
//  Created by Rodrigo Miyashiro on 22/01/18.
//  Copyright © 2018 Rodrigo Miyashiro. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ListControl
{
    func parseJSON(arrayJson: [JSON])
}

//
//  Movie.swift
//  API-Sandbox
//
//  Created by Dion Larson on 6/24/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Music {
    let name: String
    let price: Double
    let link: String
    let poster: String
    
    init(json: JSON) {
        self.name = json["collectionName"].stringValue
        self.price = json["collectionPrice"].doubleValue
        self.link = json["collectionViewUrl"].stringValue
        self.poster = json["artworkUrl100"].stringValue
    }
}

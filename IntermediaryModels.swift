//
//  IntermediaryModels.swift
//  RestaurantOrder
//
//  Created by Andres Gutierrez on 1/31/18.
//  Copyright © 2018 Andres Gutierrez. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}

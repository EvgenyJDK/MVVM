//
//  Car.swift
//  MVVM
//
//  Created by Administrator on 24.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

class Car: Mappable {
    
    var id: Int?
    var type: String?
    var model: String?
    var color: String?
    var owners: [Owner]?

    required init?(map: Map) {
    }

    required init?(id: Int, type: String, model: String, color: String) {
        self.id = id
        self.type = type
        self.model = model
        self.color = color
    }
    
    func mapping(map: Map) {
        id              <- map["car_id"]
        type            <- map["car_type"]
        model           <- map["car_model"]
        color           <- map["car_color"]
        owners          <- map["owners"]
    }
    
}

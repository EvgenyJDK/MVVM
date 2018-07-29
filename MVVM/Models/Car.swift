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
    
    required init?(map: Map) {
    }
    
    required init?(type: String, model: String, color: String) {
//        self.id = id
        self.type = type
        self.model = model
        self.color = color
    }
    
    func mapping(map: Map) {
        id              <- map["id"]
        type        <- map["type"]
        model         <- map["model"]
        color           <- map["color"]
    }
    
}

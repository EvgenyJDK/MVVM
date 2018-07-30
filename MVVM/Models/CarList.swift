//
//  CarList.swift
//  MVVM
//
//  Created by Administrator on 29.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

class CarList: Mappable {
    
    var car: [Car]?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        car           <- map["."]
    }
    
}

//
//  Owner.swift
//  MVVM
//
//  Created by Administrator on 24.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import ObjectMapper

class Owner: Mappable {
    
    var id: Int?
    var name: String?
    var phone: String?

    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id             <- map["owner_id"]
        name           <- map["owner_name"]
        phone          <- map["owner_phone"]
    }
    
}

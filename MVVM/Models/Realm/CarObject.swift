//
//  CarObject.swift
//  MVVM
//
//  Created by Administrator on 29.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Realm
import RealmSwift

class CarObject: Object {
    
    @objc dynamic var type = ""
    @objc dynamic var model = ""
    @objc dynamic var color = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func fillFrom(car: Car) {
        if let carType = car.type { type = carType }
        if let carModel = car.model { model = carModel }
        if let carColor = car.color { color = carColor }
    }
}


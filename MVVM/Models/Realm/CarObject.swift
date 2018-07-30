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
    
    @objc dynamic var id = 0
    @objc dynamic var type = ""
    @objc dynamic var model = ""
    @objc dynamic var color = ""
    @objc dynamic var ownerId = Int()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func fillFrom(car: Car) {
        if let carId = car.id { id = carId }
        if let carType = car.type { type = carType }
        if let carModel = car.model { model = carModel }
        if let carColor = car.color { color = carColor }
        
        car.owners?.forEach({ (owner) in
            if let owner_Id = owner.id {ownerId = owner_Id }
        })
    }
}


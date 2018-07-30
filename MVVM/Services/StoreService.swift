//
//  StoreService.swift
//  MVVM
//
//  Created by Administrator on 29.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import RealmSwift

class StoreService {
    static let shared = StoreService()
    
    func store(car: Car) {
        DispatchQueue(label: "background").async {
            let carObject = CarObject()
            carObject.fillFrom(car: car)
            let realm = try! Realm()
            try! realm.write {
                realm.add(carObject, update: true)
            }
        }
    }

    
    func load() -> [Car] {
        let realm = try! Realm()
        var carList: [Car] = []
        let car = realm.objects(CarObject.self)
        car.forEach { (carObject) in
            if let car = Car.init(id: carObject.id, type: carObject.type, model: carObject.model, color: carObject.color) {
                carList.append(car)
            }
        }
        return carList
    }
    
    func remove() {
        DispatchQueue(label: "background").async {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(realm.objects(CarObject.self))
            }
        }
    }
}

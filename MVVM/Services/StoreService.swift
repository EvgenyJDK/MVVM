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
    
    func store(owner: Owner) {
        DispatchQueue(label: "background").async {
            let ownerObject = OwnerObject()
            ownerObject.fillFrom(owner: owner)
            let realm = try! Realm()
            try! realm.write {
                realm.add(ownerObject, update: true)
            }
        }
    }

    func load() -> [Car] {
        let realm = try! Realm()
        var ownerList: [Owner] = []
        var carList: [Car] = []
        let owner = realm.objects(OwnerObject.self)
        let car = realm.objects(CarObject.self)

        owner.forEach { (ownerObject) in
            if let owner = Owner.init(id: ownerObject.id, name: ownerObject.name, phone: ownerObject.phone) {
                ownerList.append(owner)
            }
        }
        
        car.forEach { (carObject) in
            ownerList.forEach({ (owner) in
                if owner.id == carObject.ownerId {
                    if let car = Car.init(id: carObject.id, type: carObject.type, model: carObject.model, color: carObject.color, owners: [owner]) {
                        carList.append(car)
                    }
                }
            })
        }
        return carList
    }
    
    func remove() {
        DispatchQueue(label: "background").async {
            let realm = try! Realm()
            try! realm.write {
                realm.delete(realm.objects(OwnerObject.self))
                realm.delete(realm.objects(CarObject.self))
            }
        }
    }
}

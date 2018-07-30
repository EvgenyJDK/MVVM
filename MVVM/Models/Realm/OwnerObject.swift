//
//  OwnerObject.swift
//  MVVM
//
//  Created by Administrator on 30.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Realm
import RealmSwift

class OwnerObject: Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var phone = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func fillFrom(owner: Owner) {
        if let ownerId = owner.id { id = ownerId }
        if let ownerName = owner.name { name = ownerName }
        if let ownerPhone = owner.phone { phone = ownerPhone }
    }
}

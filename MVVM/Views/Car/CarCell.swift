//
//  CarCell.swift
//  MVVM
//
//  Created by Administrator on 24.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import UIKit

class CarCell: UITableViewCell {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var carModel: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var ownerId: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillWith(model: Car) {
        id.text = model.id?.description
        type.text = model.type
        carModel.text = model.model
        color.text = model.color
        ownerId.text = model.owners?[0].id?.description
        name.text = model.owners?[0].name
        phone.text = model.owners?[0].phone
    }
    
}

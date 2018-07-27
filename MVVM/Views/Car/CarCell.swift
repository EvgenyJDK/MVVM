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
    @IBOutlet weak var model: UILabel!
    @IBOutlet weak var color: UILabel!
    
//    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not be implemented")
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillWith(model: Car) {
        id.text = "Test"
        type.text = "2"
        color.text = "4"
    }
    
}

//
//  API.swift
//  MVVM
//
//  Created by Administrator on 29.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

enum API {

    static func getDataFromJSONFile(fileName: String, handler:@escaping ([Car]?) -> Void) {
        
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                if let jsonArray = try JSONSerialization
                    .jsonObject(with: data, options: []) as? [[String: AnyObject]] {
                    let carArray = Mapper<Car>().mapArray(JSONArray: jsonArray)
                    handler(carArray)
                }
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
    
    
    static func getDataFromNetwork(search: String, handler:@escaping (CarList?) -> Void) {
        
        // Alamofire.request ... 
        handler(nil)
    }
    
}

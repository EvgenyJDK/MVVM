//
//  CarViewModel.swift
//  MVVM
//
//  Created by Administrator on 24.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import RxSwift

class CarListViewModel {
    
    var successHandler: (([Car]) -> Void) = {giphyList in }
    var errorHandler: ((NSError) -> Void) = {_ in }
    var carList: Variable<[Car]> = Variable([])
    
    init() {
    }
    
    func load(fileName: String, store: Bool) {
        if !store { loadList(fileName: fileName) }
        else { loadListFromStore() }
    }
    
    private func loadList(fileName: String) {
        API.getDataFromJSONFile(fileName: fileName) { (carList) in
            
            if let list = carList {
                var carArr: [Car] = []
                list.forEach({ (car) in
                    StoreService.shared.store(car: car)
                    carArr.append(car)
                    print(car.model)
                })
                self.carList.value = carArr
            }
            self.successHandler(self.carList.value)
        }
    }
    
    private func loadListFromStore() {
        carList.value = StoreService.shared.load()
        self.successHandler(self.carList.value)
    }
    
    
}

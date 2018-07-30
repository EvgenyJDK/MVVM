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
    
    func load(fileName: String?, store: Bool) {
        guard let name = fileName else {
            return loadListFromStore()
        }
        if !store { loadList(fileName: name) }
        else { loadListFromStore() }
    }
    
    private func loadList(fileName: String) {
        API.getDataFromJSONFile(fileName: fileName) { (carList) in
            if let list = carList {
                var carArr: [Car] = []
                list.forEach({ (car) in
                    carArr.append(car)
                })
                self.carList.value = carArr
            }
            self.successHandler(self.carList.value)
        }
    }
    
    private func loadListFromStore() {
        carList.value = StoreService.shared.load()
        carList.value.sort { $0.id! < $1.id! }
        self.successHandler(self.carList.value)
    }
    
    func removeCar(car: Car) {
        for _ in carList.value {
            if let index = carList.value.index(where: { $0.id == car.id }) {
                carList.value.remove(at: index)
            }
            successHandler(carList.value)
        }
    }
    
}

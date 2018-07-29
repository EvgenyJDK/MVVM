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
    
    func load(store: Bool) {
        if !store { loadList() }
        else { loadListFromStore() }
    }
    
    private func loadList() {
        
    }
  
    private func loadListFromStore() {
        carList.value = StoreService.shared.load()
        self.successHandler(self.carList.value)
    }
    
    
}

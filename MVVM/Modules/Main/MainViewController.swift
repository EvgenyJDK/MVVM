//
//  ViewController.swift
//  MVVM
//
//  Created by Administrator on 24.07.2018.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit
import RxSwift

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let carListViewModel = CarListViewModel()
    private var carList: Variable<[Car]> = Variable([])
    
    var needRemoveCar: [Car] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateUI()
        observeViewModel()
        launchApp()
    }
    
    private func configurateUI() {
        tableView.register(UINib(nibName: "CarCell", bundle: nil), forCellReuseIdentifier: "carCell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    private func observeViewModel() {
        carListViewModel.successHandler = { [weak self] (carList) in
            self?.carList.value = carList
            self?.tableView.reloadData()
        }
        carListViewModel.errorHandler = { error in
            print("CarListViewModel errorHandler")
        }
    }
    
    private func launchApp() {
        carListViewModel.load(fileName: "cars", store: false)
//        carListViewModel.load(fileName: "cars", store: true)
    }
    
    private func removeCar() {
        for car in needRemoveCar {
            carListViewModel.removeCar(car: car)
        }
        needRemoveCar.removeAll()
    }
    
    
// MARK: - Actions
    
    @IBAction func loadFromFile(_ sender: Any) {
        carListViewModel.load(fileName: "cars", store: false)
    }
    
    @IBAction func loadFromDB(_ sender: Any) {
        carListViewModel.load(fileName: "", store: true)
    }
    
    @IBAction func addToDB(_ sender: Any) {
        carList.value.forEach { (car) in
            StoreService.shared.store(car: car)
        }
    }
        
    @IBAction func clearDB(_ sender: Any) {
        StoreService.shared.remove()
        needRemoveCar = carList.value
        removeCar()
    }
    
}


// MARK: - UICollectionViewDatasource

extension MainViewController: UITableViewDataSource {
    
    fileprivate func modelFrom(indexPath: IndexPath) -> Car {
        return carList.value[indexPath.row]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carCell") as! CarCell
        let model = modelFrom(indexPath: indexPath)
        cell.fillWith(model: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 167
    }
}

// MARK: - UICollectionViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
    }
}

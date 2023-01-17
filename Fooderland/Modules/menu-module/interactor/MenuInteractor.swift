//
//  MenuInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class MenuInteractor: MenuInteractorProtocol {
    //MARK: - Property
    weak var delegate: MenuInteractorDelegate?
    private let service: NetworkServiceProtocol
    private var foods = [Food]()
    private var filterdFoodList = [Food]() {
        didSet {
            delegate?.reloadData()
        }
    }
    
    //MARK: - Init
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    //MARK: - Method
    func getAllFoods() {
        delegate?.startActivityIndicator()
        service.getAllFoods { [weak self] result in
            self?.delegate?.stopActivityIndicator()
            switch result {
            case .success(let foodList):
                self?.foods = foodList
                self?.filterdFoodList = foodList
            case .failure(let error):
                self?.delegate?.showError(error: error)
            }
        }
    }
    
    func didSelectItem(at index: Int) -> Food {
        filterdFoodList[index]
        
    }
    
    func numberOfItemsInSection() -> Int {
        filterdFoodList.count
    }
    
    func didFilterFoodList(at index: Int) {
        switch index {
        case 0:
            filterdFoodList.sort(by: {$0.id < $1.id})
        case 1:
            filterdFoodList.sort(by: {Int($0.price)! < Int($1.price)!})
        case 2:
            filterdFoodList.sort(by: {Int($0.price)! > Int($1.price)!})
        case 3:
            filterdFoodList.sort(by: {$0.name < $1.name})
        default:
            filterdFoodList = foods
        }
    }
    
    func searchTextDidChange(text: String) {
        if text != "" {
            filterdFoodList = foods.filter { food in
                food.name.lowercased().contains(text.lowercased())
            }
            
        } else {
            filterdFoodList = foods
        }
    }
}

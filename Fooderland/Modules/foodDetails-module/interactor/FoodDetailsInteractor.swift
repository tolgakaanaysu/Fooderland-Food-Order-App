//
//  FoodDetailsInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//


import Foundation

final class FoodDetailsInteractor: FoodDetailsInteractorProtocol {
    //MARK: - Property
    private let service: NetworkServiceProtocol
    weak var delegate: FoodDetailsInteractorDelegate?
    
    //MARK: - Init
    init(service: NetworkServiceProtocol) {
        self.service = service
    }
    
    //MARK: - Methods
    func addToCart(food: Food, quantity: Int) {
        service.addToShoppingCart(food: food, foodQuantity: quantity.toString()) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
                break
            case.success(_):
                self?.delegate?.addedFoodToCart()
            }
        }
    }
}

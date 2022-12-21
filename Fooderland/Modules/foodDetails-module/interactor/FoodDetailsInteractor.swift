//
//  FoodDetailsInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//


import Foundation
import Alamofire
class FoodDetailsInteractor: PresenterToInteractorFoodDetailsProtocol {
    var detailsPresenter: InteractorToPresenteFoodDetailsProtcol?
    var networkService: InteractorToNetworkServiceProtocol?
    
    func addToShoppingCart(food: Food, food_quantity: String) {
        networkService?.checkAndAddFootInCart(food: food, adet: food_quantity)
       
    }

    
}

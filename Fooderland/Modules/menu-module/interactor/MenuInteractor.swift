//
//  MenuInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation
import Alamofire

final class MenuInteractor: PresenterToInteractorMenuProtocol {
    
    
    var networkService: InteractorToNetworkServiceProtocol?
    var menuPresenter: InteractorToPresenterMenuProtocol?
    
    func getAllFoods() {
        networkService?.getAllFoods()
    }
    
    func getFoodInCart() {
        networkService?.getFoodsInCart()
    }
    
    func addToShoppingCart(food: Food, food_quantity: String) {
        networkService?.checkAndAddFootInCart(food: food, adet: food_quantity)
    }
}

extension MenuInteractor: NetworkServiceToMenuInteractorProtocol {

    
    func sendFoodList(foodList: Array<Food>) {
        menuPresenter?.sendFoodList(foodList: foodList)
    }
    
    func sendCartList(foodList: Array<FoodCart>) {
        menuPresenter?.sendCartList(list: foodList)
    }
    
    
}

//
//  MenuInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation
import Alamofire

class MenuInteractor: PresenterToInteractorMenuProtocol {
    
    
    var networkService: InteractorToNetworkServiceProtocol?
    var menuPresenter: InteractorToPresenterMenuProtocol?
    
    func getAllFoods() {
        networkService?.getAllFoods()
    }
    
    func getFoodInCart() {
        networkService?.getFoodsInCart()
    }
    
    func addToShoppingCart(food: Yemekler, food_quantity: String) {
        networkService?.checkAndAddFootInCart(food: food, adet: food_quantity)
    }
}

extension MenuInteractor: NetworkServiceToMenuInteractorProtocol {

    
    func sendFoodList(foodList: Array<Yemekler>) {
        menuPresenter?.sendFoodList(foodList: foodList)
    }
    
    func sendCartList(foodList: Array<SepetYemekler>) {
        menuPresenter?.sendCartList(list: foodList)
    }
    
    
}

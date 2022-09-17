//
//  NetworkServiceProtocol.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 3.09.2022.
//

import Foundation
import Alamofire
import SwiftUI

class NetworkService: InteractorToNetworkServiceProtocol {
    
    var shoppingCartInteractor: NetworkServiceToShoppingCartInteractorProtocol?
    var menuInteractor: NetworkServiceToMenuInteractorProtocol?
    var loginInteractor: NetworkServiceToLoginInteractorProtocol?
    var registerInteractor: NetworkServiceToRegisterInteractorProtocol?
    var firebaseService: NetworkServiceToFirebaseService?
    var restApiService: NetworkServiceToRestApiService?
   
    
    func getAllFoods() {
        restApiService?.getAllFoods()
    }
    
    func getFoodsInCart() {
        restApiService?.getFoodsInCart()
    }
    
    func deleteFoodInCart(sepet_yemek_id: String) {
        restApiService?.deleteFoodInCart(sepet_yemek_id: sepet_yemek_id)
    }
    
    func clearAllCart(list: [SepetYemekler]) {
        restApiService?.clearAllCart(list: list)
    }
    
    func checkAndAddFootInCart(food: Yemekler, adet: String) {
        restApiService?.checkAndAddFootInCart(food: food, adet: adet)
    }
    
    func addToShoppingCart(food: Yemekler, food_quantity: String) {
        restApiService?.addToShoppingCart(food: food, food_quantity: food_quantity)
    }
    
    func updateCart(food: SepetYemekler, quantity: Int) {
        restApiService?.updateCart(food: food, quantity: quantity)
    }
    
    func createUser(email: String, password: String, username: String) {
        firebaseService?.createUser(email: email, password: password, username: username )
    }
    
    func signIn(email: String, password: String) {
        firebaseService?.signIn(email: email, password: password)
    }
    
    func getUsername() {
        firebaseService?.getUsername()
    }
}

extension NetworkService: RestApiServiceToNetworkService {
    func sendFoodList(foodList: [Yemekler]) {
        menuInteractor?.sendFoodList(foodList: foodList)
    }
    
    func sendCartList(foodList: Array<SepetYemekler>) {
        shoppingCartInteractor?.sendCartList(foodList: foodList)
    }
    
    func sendTotalCost(total: String) {
        shoppingCartInteractor?.sendTotalCost(total: total)
    }

}

extension NetworkService: FirebaseServiceToNetworkService {
    func sendError(error: Error?) {
        loginInteractor?.sendError(error: error)
        registerInteractor?.sendError(error: error)
    }
}

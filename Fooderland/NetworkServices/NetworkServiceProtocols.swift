//
//  NetworkService.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 3.09.2022.
//

import Foundation

protocol InteractorToNetworkServiceProtocol {
    var restApiService: NetworkServiceToRestApiService? { get set}
    var menuInteractor: NetworkServiceToMenuInteractorProtocol? { get set }
    var shoppingCartInteractor: NetworkServiceToShoppingCartInteractorProtocol? { get set }
    var firebaseService: NetworkServiceToFirebaseService? { get set }
    var loginInteractor: NetworkServiceToLoginInteractorProtocol? { get set }
    var registerInteractor: NetworkServiceToRegisterInteractorProtocol? { get set }
    
    func getAllFoods()
    
    func getFoodsInCart()
    
    func deleteFoodInCart(sepet_yemek_id: String)
    
    func clearAllCart(list: [SepetYemekler])
    
    func checkAndAddFootInCart(food: Yemekler, adet: String)
    
    func addToShoppingCart(food: Yemekler, food_quantity: String)
    
    func updateCart(food: SepetYemekler, quantity: Int)
    
    func createUser(email: String, password: String, username: String)
    
    func signIn(email: String, password: String)
    
    func getUsername()
    
}

protocol NetworkServiceToMenuInteractorProtocol {

    func sendFoodList(foodList: Array<Yemekler>)
    
    func sendCartList(foodList: Array<SepetYemekler>)
    
}

protocol NetworkServiceToShoppingCartInteractorProtocol {
  
    func sendTotalCost(total: String)
    
    func sendCartList(foodList: Array<SepetYemekler>)
    
}

protocol NetworkServiceToLoginInteractorProtocol {
    func sendError(error: Error?)
}

protocol NetworkServiceToRegisterInteractorProtocol {
    func sendError(error: Error?)
}


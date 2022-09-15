//
//  MenuProtocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

protocol ViewToPresenterMenuProtocol {
    var menuInteractor: PresenterToInteractorMenuProtocol? { get set }
    var menuView: PresenterToViewMenuProtocol? { get set }
    
    func getAllFoods()
    
    func getFoodInCart()
    
    func addToShoppingCart(food: Yemekler, food_quantity: String)
}

protocol PresenterToInteractorMenuProtocol {
    var menuPresenter: InteractorToPresenterMenuProtocol? { get set }
    var networkService: InteractorToNetworkServiceProtocol? { get set }
    
    func getAllFoods()
    
    func getFoodInCart()
    
    func addToShoppingCart(food: Yemekler, food_quantity: String)
}

protocol InteractorToPresenterMenuProtocol {
    
    func sendFoodList(foodList: Array<Yemekler>)
    
    func sendCartList(list: [SepetYemekler])
   
}

protocol PresenterToViewMenuProtocol {
    
    func sendFoodList(foodList: Array<Yemekler>)
    
    func sendCartList(list: [SepetYemekler])
   
}

protocol PresenterToRouterMenuProtocol {
    
    static func createModule(ref: MenuVC)
}

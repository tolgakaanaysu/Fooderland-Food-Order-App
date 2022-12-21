//
//  RestApiProtocol.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 15.09.2022.
//

import Foundation
import Alamofire
protocol NetworkServiceToRestApiService {
    var networkService: RestApiServiceToNetworkService? { get set }
    
    func getAllFoods()
    
    func getFoodsInCart()
    
    func deleteFoodInCart(sepet_yemek_id: String)
    
    func clearAllCart(list: [FoodCart])
    
    func checkAndAddFootInCart(food: Food, adet: String)
    
    func addToShoppingCart(food: Food, food_quantity: String)
    
    func updateCart(food: FoodCart, quantity: Int)
    
   
}

protocol RestApiServiceToNetworkService {
    func sendFoodList(foodList: [Food])
    
    func sendCartList(foodList: Array<FoodCart>)
    
    func sendTotalCost(total: String)
}

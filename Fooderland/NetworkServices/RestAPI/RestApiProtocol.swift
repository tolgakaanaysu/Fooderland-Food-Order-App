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
    
    func clearAllCart(list: [SepetYemekler])
    
    func checkAndAddFootInCart(food: Yemekler, adet: String)
    
    func addToShoppingCart(food: Yemekler, food_quantity: String)
    
    func updateCart(food: SepetYemekler, quantity: Int)
    
   
}

protocol RestApiServiceToNetworkService {
    func sendFoodList(foodList: [Yemekler])
    
    func sendCartList(foodList: Array<SepetYemekler>)
    
    func sendTotalCost(total: String)
}

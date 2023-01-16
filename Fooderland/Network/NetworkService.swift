//
//  NetworkManager.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 10.01.2023.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol: UsernameProtocol {
    func getAllFoods(completion: @escaping(Result<[Food],Error>) -> Void)
    func getFoodsInCart(completion: @escaping(Result<[FoodCart],Error>) -> Void)
    func deleteFoodInCart(by foodCartId: String)
    func clearAllCart()
    func addToShoppingCart(food: Food, foodQuantity: String, completion: @escaping(Result<String,Error>) -> Void)
    func updateCart(foodCart: FoodCart, quantity: String, completion: @escaping(Result<String,Error>) -> Void)
}

final class AlamofireNetworkService: NetworkServiceProtocol,AlamofireClientProtocol {
   
    //MARK: - Methods
    func getAllFoods(completion: @escaping (Result<[Food], Error>) -> Void) {
        let url = Endpoint.shared.allFoods
        request(responseType: FoodResponse.self, url: url , method: .get, parameters: nil) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                completion(.success(response.foods))
            }
        }
    }
    
    func getFoodsInCart(completion: @escaping (Result<[FoodCart], Error>) -> Void) {
        let url = Endpoint.shared.foodInCart
        let params = ["kullanici_adi": getUsername()]
        request(responseType: CartResponse.self, url: url, method: .post, parameters: params) { result in
            switch result {
            case .success(let response):
                completion(.success(response.foodcart))
                print(response.foodcart.count)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func deleteFoodInCart(by foodCartId: String) {
        let url = Endpoint.shared.deleteFood
        let param = ["sepet_yemek_id": foodCartId,
                     "kullanici_adi": getUsername()]
        request(url: url, method: .post, parameters: param) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let message):
                print(message)
            }
        }
    }
    
    /// There is not clear cart api. Therefore foods were deleted one by one
    func clearAllCart() {
        getFoodsInCart { result in
            switch result {
            case .success(let cart):
                cart.forEach { [weak self] food in
                    self?.deleteFoodInCart(by: food.id)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func addToShoppingCart(food: Food, foodQuantity: String, completion: @escaping(Result<String,Error>) -> Void) {
        let url = Endpoint.shared.addToCart
        let parameters: Parameters = ["yemek_adi": food.name,
                                  "yemek_resim_adi": food.imageName,
                                  "yemek_fiyat": food.price,
                                  "yemek_siparis_adet": foodQuantity,
                                  "kullanici_adi": getUsername()]
        request(url: url, method: .post, parameters: parameters) { result in
            completion(result)
        }
    }
    
    /// There is not cart update api . Therefore first delete food and add new food with new quantity
    func updateCart(foodCart: FoodCart, quantity: String, completion: @escaping(Result<String,Error>) -> Void) {
        deleteFoodInCart(by: foodCart.id)
        let url = Endpoint.shared.addToCart
        let parameters: Parameters = ["yemek_adi": foodCart.name,
                                  "yemek_resim_adi": foodCart.imageName,
                                  "yemek_fiyat": foodCart.price,
                                  "yemek_siparis_adet": quantity,
                                  "kullanici_adi": getUsername()]
        request(url: url, method: .post, parameters: parameters) { result in
            completion(result)
        }
    }
}

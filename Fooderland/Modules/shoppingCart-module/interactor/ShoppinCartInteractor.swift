//
//  ShoppinCartInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation
import Alamofire

// Presenter -> Interactor
final class ShoppinCartInteractor: PresenterToInteractorShoppingCartProtocol {
    var networkService: InteractorToNetworkServiceProtocol?
    var shoppingCartPresenter: InteractorToPresenterShoppingCartProtocol?
    
    func getFoodInCart() {
        networkService?.getFoodsInCart()
    }
    
    func deleteFoodInCart(sepet_yemek_id: String) {
        networkService?.deleteFoodInCart(sepet_yemek_id: sepet_yemek_id)
    }
    
    func clearAllCart(list: [SepetYemekler]) {
        networkService?.clearAllCart(list: list)
    }
    
    func updateCart(food: SepetYemekler, quantity: Int) {
        networkService?.updateCart(food: food, quantity: quantity)
    }
    
}


//Network Service -> Interactor
extension ShoppinCartInteractor: NetworkServiceToShoppingCartInteractorProtocol {
    func sendTotalCost(total: String) {
        print("cart interactor total: ", total)
        shoppingCartPresenter?.sendTotalCost(total: total)
    }
    
    func sendCartList(foodList: Array<SepetYemekler>) {
        shoppingCartPresenter?.sendCartList(list: foodList)
    }
}



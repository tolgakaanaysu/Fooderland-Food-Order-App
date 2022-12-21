//
//  ShoppingCartPresenter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

class ShoppingCartPresenter: ViewToPresenterShoppingCartProtocol {
    var shoppingCartInteractor: PresenterToInteractorShoppingCartProtocol?
    var shoppingCartView: PresenterToViewShoppingCartProtocol?
    
    func getFoodInCart() {
        shoppingCartInteractor?.getFoodInCart()
    }
    func deleteFoodInCart(sepet_yemek_id: String) {
        shoppingCartInteractor?.deleteFoodInCart(sepet_yemek_id: sepet_yemek_id)
    }
    
    func clearAllCart(list: [FoodCart]) {
        shoppingCartInteractor?.clearAllCart(list: list)
    }
    
    func updateCart(food: FoodCart, quantity: Int) {
        shoppingCartInteractor?.updateCart(food: food, quantity: quantity)
    }
}

extension ShoppingCartPresenter: InteractorToPresenterShoppingCartProtocol {
    func sendTotalCost(total: String) {
        shoppingCartView?.sendTotalCost(total: total)
    }
    
    func sendCartList(list: [FoodCart]) {
        shoppingCartView?.sendCartList(list: list)
    }
}

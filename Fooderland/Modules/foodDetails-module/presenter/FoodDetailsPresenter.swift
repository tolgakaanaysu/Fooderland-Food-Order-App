//
//  FoodDetailsPresenter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class FoodDetailsPresenter: ViewToPresenterFoodDetailsProtocol {
    var detailsView: PresenterToViewFoodDetailsProtocol?
    var detailsInteractor: PresenterToInteractorFoodDetailsProtocol?
    
    func addToShoppingCart(food: Food, food_quantity: String) {
        detailsInteractor?.addToShoppingCart(food: food,food_quantity: food_quantity)
    }
    
}

extension FoodDetailsPresenter: InteractorToPresenteFoodDetailsProtcol {
    func isFavorite(_ isFavorite: Bool) {
        detailsView?.isFavorite(isFavorite)
    }
}

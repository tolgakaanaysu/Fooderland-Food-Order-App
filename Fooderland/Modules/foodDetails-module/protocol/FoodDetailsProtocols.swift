//
//  FoodDetailsProtocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

// View -> Presenter
protocol ViewToPresenterFoodDetailsProtocol {
    var detailsInteractor: PresenterToInteractorFoodDetailsProtocol? { get set }
    var detailsView: PresenterToViewFoodDetailsProtocol? { get set }
    
    func addToShoppingCart(food: Yemekler, food_quantity: String)
    

}

//Presenter -> Interactor
protocol PresenterToInteractorFoodDetailsProtocol {
    var networkService: InteractorToNetworkServiceProtocol? { get set }
    var detailsPresenter: InteractorToPresenteFoodDetailsProtcol? { get set }
    
    func addToShoppingCart(food: Yemekler, food_quantity: String)
    

}


//Interactor -> Presenter
protocol InteractorToPresenteFoodDetailsProtcol {
    func isFavorite(_ isFavorite: Bool)
}

//Presenter -> View
protocol PresenterToViewFoodDetailsProtocol {
    func isFavorite(_ isFavorite: Bool)
}

//Presenter -> Router
protocol PresenterToRouterFoodDetailsProtocol {
    static func createModule(ref: FoodDetailsVC)
}

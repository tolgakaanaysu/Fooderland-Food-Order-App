//
//  FoodDetailsProtocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

//MARK: - Presenter
protocol FoodDetailsPresenterProtocol {
    var delegate: FoodDetailsPresenterDelegate { get set }
    
    func viewDidLoad()
    func clickedAddToCart(value stepperValue: Int)
}

//MARK: - PresenterDelegate
protocol FoodDetailsPresenterDelegate: AnyObject, CustomAlert {
    func prepareComponent(with food: Food)
}

//MARK: - Interactor
protocol FoodDetailsInteractorProtocol {
    var delegate: FoodDetailsInteractorDelegate? { get set }
    func addToCart(food: Food, quantity: Int)
}

//MARK: - InteractorDelegate
protocol FoodDetailsInteractorDelegate: AnyObject {
    func addedFoodToCart()
}

//MARK: - FoodDetailsRouter
protocol FoodDetailsRouterProtocol {
    func dismissView()
}

//
//  FoodDetailsPresenter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class FoodDetailsPresenter: FoodDetailsPresenterProtocol {
    //MARK: - Property
    unowned var delegate: FoodDetailsPresenterDelegate
    private var interactor: FoodDetailsInteractorProtocol
    private var router: FoodDetailsRouter
    private var selectedFood: Food
    
    //MARK: - Init
    init(view delegate: FoodDetailsPresenterDelegate, interactor: FoodDetailsInteractorProtocol, router: FoodDetailsRouter, food selectedFood: Food) {
        self.delegate = delegate
        self.interactor = interactor
        self.router = router
        self.selectedFood = selectedFood
        self.interactor.delegate = self
    }
    
    //MARK: - Methods
    func viewDidLoad() {
        delegate.prepareComponent(with: selectedFood)
    }
    
    func clickedAddToCart(value stepperValue: Int) {
        interactor.addToCart(food: selectedFood, quantity: stepperValue)
    }
}

//MARK: - FoodDetailsInteractorDelegate
extension FoodDetailsPresenter: FoodDetailsInteractorDelegate {
    func addedFoodToCart() {
        router.dismissView()
    }
}

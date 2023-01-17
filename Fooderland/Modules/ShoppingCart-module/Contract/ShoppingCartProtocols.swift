//
//  ShoppingCartProtocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

//MARK: - PresenterProtocol
protocol ShoppingCartPresenterProtocol { //FIXME: AnyObject? value type? - refereance type?
    var view: ShoppingCartPresenterDelegate? { get set }
    
    // Presenter -> Interactor
    func viewDidLoad()
    func clickedTrashButton()
    func cellForRowAt(at index: Int) -> FoodCart
    func numberOfRowsInSection() -> Int
    func deleteFood(at index: Int)
    func clickedMinusButton(at index: Int)
    func clickedPlusButton(at index: Int)
    
    // Presenter -> Router
    func clickedCheckoutButton()
}

//MARK: - PresenterDelegate
protocol ShoppingCartPresenterDelegate: AnyObject {
    func prepareComponent()
    func tableViewReloadData()
    func cartIsEmpty(isEmpty: Bool)
    func startIndicator()
    func stopIndicator()
}

//MARK: - InteractorProtocol
protocol ShoppingCartInteractorProtocol {
    var presenter: ShoppingCartInteractorDelegate? { get set }
    
    func getCartList()
    func deleteFood(at index: Int)
    func deleteAllFood()
    func cartListCount() -> Int
    func getFood(at index: Int) -> FoodCart
    func decreaseFoodQuantity(at index: Int)
    func increaseFoodQuantity(at index: Int)
    
}

//MARK: - InteractorDelegate
protocol ShoppingCartInteractorDelegate: AnyObject {
    func tableViewReloadData()
    func cartIsEmpty(isEmpty: Bool)
    func startIndicator()
    func stopIndicator()
}

//MARK: - RouterDelegate
protocol ShoppingCartRouterProtocol {
    func navigatePaymentModule()
}
    

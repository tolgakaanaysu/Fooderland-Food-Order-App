//
//  ShoppingCartPresenter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class ShoppingCartPresenter: ShoppingCartPresenterProtocol {
    
    private var interactor: ShoppingCartInteractorProtocol
    private let router: ShoppingCartRouterProtocol
    var view: ShoppingCartPresenterDelegate?
    
    init(view: ShoppingCartPresenterDelegate,
         interactor: ShoppingCartInteractorProtocol,
         router: ShoppingCartRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.interactor.presenter = self
    }
    
    func viewDidLoad() {
        view?.prepareComponent()
        interactor.getCartList()
    }
    
    func clickedCheckoutButton() {
        router.navigatePaymentModule()
    }
    
    func clickedTrashButton() {
        interactor.deleteAllFood()
    }
    
    func cellForRowAt(at index: Int) -> FoodCart {
        interactor.getFood(at: index)
    }
    
    func numberOfRowsInSection() -> Int {
        interactor.cartListCount()
    }
    
    func deleteFood(at index: Int) {
        interactor.deleteFood(at: index)
    }
    
    func clickedMinusButton(at index: Int) {
        interactor.decreaseFoodQuantity(at: index)
    }
    
    func clickedPlusButton(at index: Int) {
        interactor.increaseFoodQuantity(at: index)
    }
}

extension ShoppingCartPresenter: ShoppingCartInteractorDelegate {
    func tableViewReloadData() {
        view?.tableViewReloadData()
    }
    
    func cartIsEmpty(isEmpty: Bool) {
        view?.cartIsEmpty(isEmpty: isEmpty)
    }
    func startIndicator() {
        view?.startIndicator()
    }
    
    func stopIndicator() {
        view?.stopIndicator()
    }
}

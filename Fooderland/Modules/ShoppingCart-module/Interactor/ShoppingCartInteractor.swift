//
//  ShoppinCartInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class ShoppinCartInteractor: ShoppingCartInteractorProtocol {
    
    //MARK: - Prooerties
    var presenter: ShoppingCartInteractorDelegate?
    private var network: NetworkServiceProtocol
    private var foodCartList = [FoodCart]() {
        didSet{
            if foodCartList.isEmpty {
                presenter?.cartIsEmpty(isEmpty: true)
            } else {
                presenter?.cartIsEmpty(isEmpty: false)
            }
            presenter?.tableViewReloadData()
        }
    }
    
    //MARK: - Init
    init(network: NetworkServiceProtocol) {
        self.network = network
    }
    
    //MARK: - Methods
    func getCartList() {
        presenter?.startIndicator()
        network.getFoodsInCart { [weak self] result in
            self?.presenter?.stopIndicator()
            switch result {
            case .success(let cartList):
                self?.foodCartList = cartList
                print(self?.foodCartList.count ?? "nil")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteFood(at index: Int) {
        let food = foodCartList[index]
        network.deleteFoodInCart(by: food.id)
    }
    
    func deleteAllFood() {
        //TODO: Delete all foods
    }
    
    func cartListCount() -> Int {
        foodCartList.count
    }
    
    func getFood(at index: Int) -> FoodCart {
        foodCartList[index]
    }
    
    func decreaseFoodQuantity(at index: Int) {
        let food = foodCartList[index]
        guard var quantity = food.quaintity.toInt(),
        quantity > 1 else { return }
        quantity -= 1
        network.updateCart(foodCart: food, quantity: quantity.toString()) { result in
            switch result {
            case .success(let successMessage):
                print(successMessage)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func increaseFoodQuantity(at index: Int) {
        let food = foodCartList[index]
        guard var quantity = food.quaintity.toInt(),
        quantity > 1 else { return }
        quantity += 1
        network.updateCart(foodCart: food, quantity: quantity.toString()) { result in
            switch result {
            case .success(let successMessage):
                print(successMessage)
            case .failure(let error):
                print(error)
            }
        }
    }
}

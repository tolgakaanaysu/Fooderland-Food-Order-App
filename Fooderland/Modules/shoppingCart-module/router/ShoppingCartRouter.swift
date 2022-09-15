//
//  ShoppingCartRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

class ShoppingCartRouter: PresenterToRouterShoppingCartProtocol {
    static func createModule(ref: ShoppingCartVC) {
        let presenter = ShoppingCartPresenter()
        let interactor =  ShoppinCartInteractor()
        let networkService = NetworkService()
        let restApiService = RestApiService()
        
        // view
        ref.shoppingCartPresenter = presenter
        
        // presenter
        ref.shoppingCartPresenter?.shoppingCartView = ref
        ref.shoppingCartPresenter?.shoppingCartInteractor = interactor
        
        //interactor
        ref.shoppingCartPresenter?.shoppingCartInteractor?.shoppingCartPresenter = presenter
        ref.shoppingCartPresenter?.shoppingCartInteractor?.networkService = networkService
        
        //networkService
        ref.shoppingCartPresenter?.shoppingCartInteractor?.networkService?.shoppingCartInteractor = interactor
        
        //RestApiService
        ref.shoppingCartPresenter?.shoppingCartInteractor?.networkService?.restApiService = restApiService
        ref.shoppingCartPresenter?.shoppingCartInteractor?.networkService?.restApiService?.networkService = networkService
    }
    
    
}

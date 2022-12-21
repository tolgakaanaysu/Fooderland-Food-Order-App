//
//  MenuRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class MenuRouter: PresenterToRouterMenuProtocol {
    static func createModule(ref: MenuVC) {
        let presenter = MenuPresenter()
        let interactor = MenuInteractor()
        let network = NetworkService()
        let restApi = RestApiService()
        
        //View
        ref.menuPresenter = presenter
        
        //Presneter
        ref.menuPresenter?.menuView = ref
        ref.menuPresenter?.menuInteractor = interactor
        
        //Interactor
        ref.menuPresenter?.menuInteractor?.menuPresenter = presenter
        ref.menuPresenter?.menuInteractor?.networkService = network
        
        //NetworkService
        ref.menuPresenter?.menuInteractor?.networkService?.menuInteractor = interactor
        
        //RestApiService
        ref.menuPresenter?.menuInteractor?.networkService?.restApiService = restApi
        ref.menuPresenter?.menuInteractor?.networkService?.restApiService?.networkService = network
    }
}

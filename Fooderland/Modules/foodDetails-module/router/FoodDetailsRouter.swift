//
//  FoodDetailsRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class FoodDetailsRouter:PresenterToRouterFoodDetailsProtocol {
    static func createModule(ref: FoodDetailsVC) {
        
        // View
        ref.detailsPresenter = FoodDetailsPresenter()
        
        // Presenter
        ref.detailsPresenter?.detailsInteractor = FoodDetailsInteractor()
        
        //Interactor
        ref.detailsPresenter?.detailsInteractor?.networkService = NetworkService()
        
        //NetworkService
        ref.detailsPresenter?.detailsInteractor?.networkService?.restApiService = RestApiService()
        
    }
}

//
//  xRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

class RegisterRouter: PresenterToRouterRegisterProtocol {
    static func createModule(ref :RegisterVC) {
        let presenter = RegisterPresenter()
        let interactor = RegisterInteractor()
        let network = NetworkService()
        let firebase = FirebaseService()
        
        // View
        ref.registerPresenter = presenter
        
        //Presenter//
        ref.registerPresenter?.registerInteractor = interactor
        ref.registerPresenter?.registerView = ref
        
        //Interactor
        ref.registerPresenter?.registerInteractor?.networkService = network
        ref.registerPresenter?.registerInteractor?.registerPresenter = presenter
        
        //NetworkService
        ref.registerPresenter?.registerInteractor?.networkService?.firebaseService = firebase
        ref.registerPresenter?.registerInteractor?.networkService?.registerInteractor = interactor
        
        //Firebase
        ref.registerPresenter?.registerInteractor?.networkService?.firebaseService?.networkService = network
    }
}

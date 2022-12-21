//
//  xRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

final class LoginRouter: PresenterToRouterLoginProtocol {
    static func createModule(ref: LoginVC) {
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let network = NetworkService()
        let firebase = FirebaseService()
        
        //View
        ref.loginPresenter = presenter
        
        //Presenter
        ref.loginPresenter?.loginView = ref
        ref.loginPresenter?.loginInteractor = interactor
        
        //Interactor
        ref.loginPresenter?.loginInteractor?.networkService = network
        ref.loginPresenter?.loginInteractor?.loginPresenter = presenter
        
        //Network Service
        ref.loginPresenter?.loginInteractor?.networkService?.firebaseService = firebase
        ref.loginPresenter?.loginInteractor?.networkService?.loginInteractor = interactor
        
        //Firebase
        ref.loginPresenter?.loginInteractor?.networkService?.firebaseService?.networkService = network
        
        
    }
}

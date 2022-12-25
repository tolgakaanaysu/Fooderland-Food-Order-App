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
        presenter.loginInteractor = interactor
        presenter.loginView = ref
        
        //Interactor
        interactor.networkService = network
        interactor.loginPresenter = presenter
        
        //Network Service
        network.loginInteractor = interactor
        network.firebaseService = firebase
        
        //Firebase
        firebase.networkService = network
        
        
    }
}

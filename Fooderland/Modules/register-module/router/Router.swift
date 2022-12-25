//
//  xRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

final class RegisterRouter: PresenterToRouterRegisterProtocol {
    static func createModule(ref :RegisterVC) {
        lazy var presenter = RegisterPresenter()
        lazy var interactor = RegisterInteractor()
        lazy var network = NetworkService()
        lazy var firebase = FirebaseService()
        
        // View
        ref.registerPresenter = presenter
        
        //Presenter//
        presenter.registerInteractor = interactor
        presenter.registerView = ref
        
        //Interactor
        interactor.networkService = network
        interactor.registerPresenter = presenter
        
        //NetworkService
        network.registerInteractor = interactor
        network.firebaseService = firebase
        
        //Firebase
        firebase.networkService = network
    }
}

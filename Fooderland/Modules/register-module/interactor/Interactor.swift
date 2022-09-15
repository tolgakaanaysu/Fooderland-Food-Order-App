//
//  Interactor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

class RegisterInteractor: PresenterToInteractorRegisterProtocol {
    
    var registerPresenter: InteractorToPresenterRegisterProtocol?
    var networkService: InteractorToNetworkServiceProtocol?
    
    func createUser(email: String, password: String) {
        networkService?.createUser(email: email, password: password)
    }
}

extension RegisterInteractor: NetworkServiceToRegisterInteractorProtocol {
    func sendError(error: Error?) {
        registerPresenter?.sendError(error: error)
    }
}

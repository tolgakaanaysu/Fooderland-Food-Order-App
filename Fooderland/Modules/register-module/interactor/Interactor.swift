//
//  Interactor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

final class RegisterInteractor: PresenterToInteractorRegisterProtocol {
    
    var registerPresenter: InteractorToPresenterRegisterProtocol?
    var networkService: InteractorToNetworkServiceProtocol?
    
    func createUser(email: String, password: String, username: String) {
        networkService?.createUser(email: email, password: password, username: username)
    }
}

extension RegisterInteractor: NetworkServiceToRegisterInteractorProtocol {
    func sendError(error: Error?) {
        registerPresenter?.sendError(error: error)
    }
}

//
//  Interactor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

class LoginInteractor: PresenterToInteractorLoginProtocol {
    var networkService: InteractorToNetworkServiceProtocol?
    
    var loginPresenter: InteractorToPresenterLoginProtocol?
   
    
    func signIn(email: String, password: String) {
        networkService?.signIn(email: email, password: password)
    }
    func getUsername() {
        networkService?.getUsername()
    }
}

extension LoginInteractor: NetworkServiceToLoginInteractorProtocol {
    func sendError(error: Error?) {
        loginPresenter?.sendError(error: error)
    }
}

//
//  Presenter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

class RegisterPresenter: ViewToPresenterRegisterProtocol {
   
    var registerInteractor: PresenterToInteractorRegisterProtocol?
    var registerView: PresenterToViewRegisterProtocol?
    
    func createUser(email: String, password: String) {
        registerInteractor?.createUser(email: email, password: password)
     
    }
}

extension RegisterPresenter: InteractorToPresenterRegisterProtocol {
    func sendError(error: Error?) {
        registerView?.sendError(error: error)
    }
}


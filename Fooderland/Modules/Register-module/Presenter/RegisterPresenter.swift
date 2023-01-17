//
//  Presenter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

final class RegisterPresenter: RegisterPresenterProtocol {
  
    private let router: RegisterRouterProtocol
    private let interactor: RegisterInteractorProtocol
    weak var view: RegisterPresnterDelegate?
    
    init(view: RegisterPresnterDelegate, router: RegisterRouterProtocol, interactor: RegisterInteractorProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func createUser(email: String, password: String, username: String) {
        interactor.createUser(email: email, password: password, username: username)
    }
}

extension RegisterPresenter: RegisterInteractorDelegate {
    func showErrorMessage(message: String) {
        view?.showErrorMessage(message: message)
    }
    
    func showSuccessMessage(message: String) {
        view?.showSuccessMessage(message: message)
    }
    
    func navigate() {
        router.navigate()
    }
}

//
//  RegisterInteractor.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation

final class RegisterInteractor: RegisterInteractorProtocol {
 
    //MARK: - Property
    private weak var auth: AuthenticationProtocol?
    weak var presenter: RegisterInteractorDelegate?
    
    //MARK: - init
    init(auth: AuthenticationProtocol) {
        self.auth = auth
    }
    
    //MARK: - Method
    func createUser(email: String, password: String, username: String) {
        auth?.createUser(email: email, password: password, username: username) { [presenter] result in
            switch result {
            case .success(let successMessage):
                presenter?.showSuccessMessage(message: successMessage)
            case .failure(let error):
                presenter?.showErrorMessage(message: error.localizedDescription)
            }
        }
    }
}

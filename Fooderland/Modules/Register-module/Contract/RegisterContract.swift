//
//  RegisterContract.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 15.01.2023.
//

import Foundation

//MARK: - Presenter
protocol RegisterPresenterProtocol {
    var view: RegisterPresnterDelegate? { get set }
    
    func createUser(email: String, password: String, username: String)
}

protocol RegisterPresnterDelegate: AnyObject {
    func showErrorMessage(message: String)
    func showSuccessMessage(message: String)
}

//MARK: - Intereactor
protocol RegisterInteractorProtocol {
    var presenter: RegisterInteractorDelegate? { get set }
    
    func createUser(email: String, password: String, username: String)
}

protocol RegisterInteractorDelegate: AnyObject {
    func showErrorMessage(message: String)
    func showSuccessMessage(message: String)
    func navigate()
}

//MARK: - Router
protocol RegisterRouterProtocol: AnyObject {
    func navigate()
}

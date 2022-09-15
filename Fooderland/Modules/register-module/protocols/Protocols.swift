//
//  Protocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import Foundation


//
//  Protocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

// View -> Presenter
protocol ViewToPresenterRegisterProtocol {
    var registerInteractor: PresenterToInteractorRegisterProtocol? { get set }
    var registerView: PresenterToViewRegisterProtocol? { get set }
    
    func createUser(email: String, password: String)
}

//Presenter -> Interactor
protocol PresenterToInteractorRegisterProtocol {
    var registerPresenter: InteractorToPresenterRegisterProtocol? { get set }
    var networkService: InteractorToNetworkServiceProtocol? { get set }
    
    func createUser(email: String, password: String)
    
}

//Interactor -> Presenter
protocol InteractorToPresenterRegisterProtocol {
    func sendError(error: Error?)

   
}

//Presenter -> View
protocol PresenterToViewRegisterProtocol {
    func sendError(error: Error?)
   
}

//Presenter -> Router
protocol PresenterToRouterRegisterProtocol {
    static func createModule(ref :RegisterVC)
}

//
//  RegisterBuilder.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 15.01.2023.
//

import UIKit

final class RegisterBuilder {
    static func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "RegisterVC") as! RegisterVC
        
        let firebaseAuth = FirebaseAuthentication()
        
        let router = RegisterRouter(view: view)
        
        let interactor = RegisterInteractor(auth: firebaseAuth)
        
        let presenter = RegisterPresenter(view: view, router: router, interactor: interactor)
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        return view
    }
}

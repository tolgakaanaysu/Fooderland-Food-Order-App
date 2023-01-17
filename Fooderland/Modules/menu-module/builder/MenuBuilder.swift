//
//  MenuBuilder.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 12.01.2023.
//

import UIKit

final class MenuBuilder {
    
    static func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "Menu", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let router = MenuRouter(view: view)
        let interactor = MenuInteractor(service: app.networkService)
        let presenter = MenuPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
    
    static func start(view: MenuViewController) {
        let router = MenuRouter(view: view)
        let interactor = MenuInteractor(service: app.networkService)
        let presenter = MenuPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
    }
}

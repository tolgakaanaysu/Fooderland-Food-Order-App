//
//  ShoppingCartBuilder.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 16.01.2023.
//

import UIKit

final class ShoppingCartBuilder {
    static func make() -> UIViewController {
        let storyboard = UIStoryboard(name: "ShoppingCart", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ShoppingCartVC") as! ShoppingCartVC
        
        let router = ShoppingCartRouter(view: view)
        let interactor = ShoppinCartInteractor(network: app.networkService)
        let presenter = ShoppingCartPresenter(view: view,
                                              interactor: interactor,
                                              router: router)
        view.presenter = presenter
        return view
    }
}

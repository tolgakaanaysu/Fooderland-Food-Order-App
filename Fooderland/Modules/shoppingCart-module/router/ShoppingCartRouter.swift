//
//  ShoppingCartRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import UIKit

final class ShoppingCartRouter: ShoppingCartRouterProtocol {
    private unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigatePaymentModule() {
        print("Pushing paywall")
    }
}

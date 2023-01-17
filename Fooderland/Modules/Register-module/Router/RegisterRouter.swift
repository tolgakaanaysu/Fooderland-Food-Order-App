//
//  xRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 8.09.2022.
//

import UIKit

final class RegisterRouter: RegisterRouterProtocol {
    private unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate() {
        view.dismiss(animated: true)
    }
}

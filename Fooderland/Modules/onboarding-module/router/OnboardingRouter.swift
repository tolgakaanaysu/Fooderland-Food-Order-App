//
//  OnboardingRouter.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 12.01.2023.
//

import UIKit

final class OnboardingRouter: OnboardingRouterProtocol {
    
    func navigate() {
        let tabbarVC = TabBarBuilder.make()
        app.router.changeRootViewController(viewController: tabbarVC)
        app.router.start()
    }
}

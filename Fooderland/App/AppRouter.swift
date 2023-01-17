//
//  AppRouter.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 12.01.2023.
//

import UIKit

final class AppRouter {
    //MARK: - Property
    private var rootViewController: UIViewController
    var window: UIWindow?
    
    //MARK: - Init
    init(windowScene: UIWindowScene) {
        window = UIWindow(windowScene: windowScene)
        rootViewController = OnboardingBuilder.make()
    }

    //MARK: - Methods
    func start() {
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func changeRootViewController(viewController: UIViewController) {
        self.rootViewController = viewController
    }
}


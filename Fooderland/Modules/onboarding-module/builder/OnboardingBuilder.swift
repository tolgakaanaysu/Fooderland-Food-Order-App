//
//  OnboardingBuilder.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 12.01.2023.
//

import UIKit

final class OnboardingBuilder {
    static func make() -> OnboardingViewController {
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController") as! OnboardingViewController
        let router = OnboardingRouter()
        let presenter = OnboardingPresenter(router: router)
        view.presenter = presenter
        return view
    }
}

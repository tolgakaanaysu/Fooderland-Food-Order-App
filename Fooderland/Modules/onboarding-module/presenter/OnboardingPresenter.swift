//
//  OnboardingPresenter.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 14.01.2023.
//

import Foundation

final class OnboardingPresenter: OnboardingPresenterProtocol {
    private var router: OnboardingRouterProtocol
    
    init(router: OnboardingRouterProtocol) {
        self.router = router
    }
    
    func clickedStartButton() {
        router.navigate()
    }
}

//
//  OnboardingContract.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 14.01.2023.
//

import Foundation

//MARK: - Presenter
protocol OnboardingPresenterProtocol {
    func clickedStartButton()
}

//MARK: - Router
protocol OnboardingRouterProtocol: AnyObject {
    func navigate()
}

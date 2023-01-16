//
//  FoodDetailsRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import UIKit

final class FoodDetailsRouter: FoodDetailsRouterProtocol {
    //MARK: - Property
    private let view: UIViewController
    
    //MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }
    
    //MARK: - Methods
    func dismissView() {
        view.dismiss(animated: true)
    }
}

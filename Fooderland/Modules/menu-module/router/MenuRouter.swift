//
//  MenuRouter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import UIKit

final class MenuRouter: MenuRouterProtocol {
    //MARK: - Property
    private unowned let view: UIViewController
    
    //MARK: - Init
    init(view: UIViewController) {
        self.view = view
    }
    
    //MARK: - Method
    func navigate(to food: Food) {
        let detailsVc = FoodDetailsBuilder.start(with: food)
        view.present(detailsVc, animated: true)
    }
}

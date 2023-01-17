//
//  FoodDetailsBuilder.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 12.01.2023.
//

import UIKit

final class FoodDetailsBuilder {
    static func start(with food: Food) -> UIViewController {
        let storyboard = UIStoryboard(name: "Detay", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "FoodDetailsVC") as! FoodDetailsVC
        let router = FoodDetailsRouter(view: view)
        let interactor = FoodDetailsInteractor(service: app.networkService)
        let presenter = FoodDetailsPresenter(view: view, interactor: interactor, router: router, food: food)
        view.presenter = presenter
        return view
    }
}

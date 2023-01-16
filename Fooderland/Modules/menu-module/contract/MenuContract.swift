//
//  MenuProtocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation


//MARK: -  Presenter
protocol MenuPresenterProtocol: AnyObject {
    
    func viewDidLoad()
    func numberOfItemsInSection() -> Int
    func cellForItem(at index: Int) -> Food
    func didSelectItem(at index: Int)
    func selectedSegmentedController(at index: Int)
    func searchTextDidChange(text: String)
}

//MARK: -  PresenterDelegate
protocol MenuPresenterDelegate: AnyObject, CustomAlert {
    func prepareComponents()
    func reloadData()
}


//MARK: -  Interactor
protocol MenuInteractorProtocol: AnyObject {
    var delegate: MenuInteractorDelegate? { get set }
    
    func getAllFoods()
    func didSelectItem(at index: Int) -> Food
    func numberOfItemsInSection() -> Int
    func didFilterFoodList(at index: Int)
    func searchTextDidChange(text: String)

}

//MARK: -  InteractorDelegate
protocol MenuInteractorDelegate: AnyObject {
    func startActivityIndicator()
    func stopActivityIndicator()
    func reloadData()
    func showError(error: Error)
}

//MARK: - Router
protocol MenuRouterProtocol {
    func navigate(to food: Food)
}

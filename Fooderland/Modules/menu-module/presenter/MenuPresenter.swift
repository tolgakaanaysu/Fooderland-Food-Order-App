//
//  MenuPresenter.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

final class MenuPresenter: MenuPresenterProtocol {
    
    //MARK: - Property
    private unowned var delegate: MenuPresenterDelegate
    private let interactor: MenuInteractorProtocol
    private let router: MenuRouterProtocol
    
  
    //MARK: - Init
    init(view: MenuPresenterDelegate, interactor: MenuInteractorProtocol, router: MenuRouterProtocol) {
        self.delegate = view
        self.router = router
        self.interactor = interactor
        self.interactor.delegate = self
    }
    
    //MARK: - Methods
    func viewDidLoad() {
        //Load components
        delegate.prepareComponents()
        
        //Load food list
        interactor.getAllFoods()
        
    }
    
    func numberOfItemsInSection() -> Int {
        interactor.numberOfItemsInSection()
    }
    
    func didSelectItem(at index: Int) {
        let food = interactor.didSelectItem(at: index)
        router.navigate(to: food)
    }
    
    func cellForItem(at index: Int) -> Food {
        interactor.didSelectItem(at: index)
    }
    
    func selectedSegmentedController(at index: Int) {
        interactor.didFilterFoodList(at: index)
    }
    
    func searchTextDidChange(text: String) {
        interactor.searchTextDidChange(text: text)
    }
}

extension MenuPresenter: MenuInteractorDelegate {
    func startActivityIndicator() {
        delegate.startProgressAnimating()
    }
    
    func stopActivityIndicator() {
        delegate.stopAnimating()
    }
   
    func showError(error: Error) {
        delegate.showErrorAlert(message: error.localizedDescription)
    }
    
    func reloadData() {
        delegate.reloadData()
    }
}

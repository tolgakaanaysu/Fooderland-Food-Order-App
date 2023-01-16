//
//  TabBarPresenter.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 15.01.2023.
//

import Foundation

final class TabBarPresenter: TabBarPresenterProtocol {
    private unowned let view: TabBarPresenterDelegate
    
    init(view: TabBarPresenterDelegate) {
        self.view = view
    }
    
    func viewDidLoad() {
        view.configureBarItem()
        view.setupViewController()
    }
}

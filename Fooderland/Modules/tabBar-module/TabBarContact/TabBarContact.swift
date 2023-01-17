//
//  TabBarContact.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 15.01.2023.
//

import Foundation

protocol TabBarPresenterProtocol {
    func viewDidLoad()
}

protocol TabBarPresenterDelegate: AnyObject {
    func configureBarItem()
    func setupViewController()
}

protocol TabBarRouterProtocol {
    
}

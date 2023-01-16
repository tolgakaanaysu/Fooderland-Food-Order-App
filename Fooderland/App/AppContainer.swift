//
//  AppContainer.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 12.01.2023.
//

import Foundation

final class AppContainer {
    var networkService: NetworkServiceProtocol
    var router: AppRouter
    
    init(router: AppRouter) {
        self.networkService = AlamofireNetworkService()
        self.router = router
    }
}

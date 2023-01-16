//
//  Endpoint.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 11.01.2023.
//

import Foundation

final class Endpoint {
    //MARK: - Singleton
    static let shared = Endpoint()
    
    //MARK: - Property
    private let base = "http://kasimadalan.pe.hu/yemekler/"
    
    var allFoods: URL {
        let urlString = base + "tumYemekleriGetir.php"
        return getUrl(urlString: urlString)
        
    }
    
    var deleteFood: URL {
        let urlString = base + "sepettenYemekSil.php"
        return getUrl(urlString: urlString)
        
    }
    
    var addToCart: URL {
        let urlString = base + "sepeteYemekEkle.php"
        return getUrl(urlString: urlString)
        
    }
    
    var foodInCart: URL {
        let urlString = base + "sepettekiYemekleriGetir.php"
        return getUrl(urlString: urlString)
        
    }
    
    func foodImage(with foodName: String) -> URL {
        let urlString = base + "resimler/" + foodName
        return getUrl(urlString: urlString)
        
    }
    
    //MARK: - Methods
    private func getUrl(urlString: String) -> URL {
        guard let url = URL(string: urlString) else {
                preconditionFailure("Invalid URL")
        }
        return url
    }
    
    //MARK: - Init
    private init(){}
    
}

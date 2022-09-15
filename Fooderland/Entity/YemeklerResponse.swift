//
//  YemeklerResponse.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

class YemeklerResponse: Codable {
    var yemekler: [Yemekler]?
    var success: Int?
    
    init(yemekler: [Yemekler], success: Int = 0) {
        self.yemekler = yemekler
        self.success = success
    }
}

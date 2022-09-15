//
//  SepetYemeklerResponse.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 6.09.2022.
//

import Foundation

class SepetYemeklerResponse: Codable {
    var sepet_yemekler: [SepetYemekler]?
    var success: Int?
    
    init(yemekler: [SepetYemekler], success: Int = 0) {
        self.sepet_yemekler = yemekler
        self.success = success
    }
}

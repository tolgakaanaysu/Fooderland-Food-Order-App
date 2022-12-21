//
//  CartResponse.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 6.09.2022.
//

import Foundation

struct CartResponse: Codable {
    var foodcart: [FoodCart]?
    var success: Int?
    
}

//
//  CartResponse.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 6.09.2022.
//

import Foundation

//FIXME: Optionel All Models
struct CartResponse: Codable {
    let foodcart: [FoodCart]
    let success: Int
    
    enum CodingKeys: CodingKey {
        case foodcart
        case success
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.foodcart = try container.decodeIfPresent([FoodCart].self, forKey: .foodcart) ?? []
        self.success = try container.decodeIfPresent(Int.self, forKey: .foodcart) ?? 0
    }
}

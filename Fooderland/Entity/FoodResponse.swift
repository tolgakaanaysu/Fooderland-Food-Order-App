//
//  YemeklerResponse.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

struct FoodResponse: Codable {
    var foods: [Food]
    var success: Int
    
    enum CodingKeys: String, CodingKey {
        case foods = "yemekler"
        case success
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.foods = try container.decodeIfPresent([Food].self, forKey: .foods) ?? []
        self.success = try container.decodeIfPresent(Int.self, forKey: .success) ?? 0
    }
}







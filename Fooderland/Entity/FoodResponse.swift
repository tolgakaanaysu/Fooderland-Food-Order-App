//
//  YemeklerResponse.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 2.09.2022.
//

import Foundation

struct FoodResponse: Codable {
    var foods: [Food]?
    var success: Int?
}

//
//  UsernameProtocol.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 11.01.2023.
//

import Foundation
import FirebaseAuth

protocol UsernameProtocol {
    func getUsername() -> String
}

extension UsernameProtocol {
    func getUsername() -> String {
//        guard let username = Auth.auth().currentUser?.displayName else {
//            preconditionFailure("Username can not found")
//        }
//        return username
        return "test-V.1.0"
    }
}

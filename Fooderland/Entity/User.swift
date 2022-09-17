//
//  User.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 17.09.2022.
//

import Foundation

class User {
    
    static var email: String?
    static var password: String?
    static var username: String?
    static var profilePhoto: String?
    
    init(email: String, password: String, username: String, profilePhoto: String) {
        User.email = email
        User.password = password
        User.username = username
        User.profilePhoto = profilePhoto
    }
}

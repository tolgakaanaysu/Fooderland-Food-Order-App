//
//  FirebaseProtocols.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 15.09.2022.
//

import Foundation

protocol NetworkServiceToFirebaseService {
    var networkService: FirebaseServiceToNetworkService? { get set }
    
    func createUser(email: String, password: String, username: String)
    
    func signIn(email: String, password: String)
    
    func getUsername()
}

protocol FirebaseServiceToNetworkService {
    func sendError(error: Error?)
    
}

//
//  Authentication.swift
//  Fooderland
//
//  Created by Tolga Kağan Aysu on 10.01.2023.
//

import Foundation
import FirebaseAuth

protocol AuthenticationProtocol: AnyObject {
    func createUser(email: String, password: String, username: String, completion: @escaping(Result<String,Error>) -> Void )
    func signIn(email: String, password: String, completion: @escaping(Result<String,Error>) -> Void)
}

final class FirebaseAuthentication: AuthenticationProtocol {
    func createUser(email: String, password: String, username: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error {
                completion(.failure(error))
            } else {
                completion(.success("Success"))
            }
        }
      
    }
    
    func signIn(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error {
                completion(.failure(error))
            } else {
                completion(.success("Success"))
            }
        }
    }
}

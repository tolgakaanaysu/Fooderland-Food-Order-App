//
//  FirebaseService.swift
//  Food Order App
//
//  Created by Tolga Kağan Aysu on 15.09.2022.
//

import Foundation
import FirebaseAuth

final class FirebaseService: NetworkServiceToFirebaseService {
    var networkService: FirebaseServiceToNetworkService?
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            
            if error == nil  {
                strongSelf.networkService?.sendError(error: nil)
        
            }else {
                strongSelf.networkService?.sendError(error: error)
            }
          
        }
    }
    
    func createUser(email: String, password: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let strongSelf = self else { return }
            
            if error == nil  {
                strongSelf.updateUser(username: username)
        
            } else {
                strongSelf.networkService?.sendError(error: error)
            }
        }
    }
    
    func updateUser(username: String){
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        changeRequest?.displayName = username
        changeRequest?.commitChanges(completion: {[weak self] error in
            guard let strongSelf = self else { return }
            if error == nil {
                strongSelf.networkService?.sendError(error: nil)
            }else {
                strongSelf.networkService?.sendError(error: error)
            }
        })
    }
    
     func getUsername() {
        guard let username = Auth.auth().currentUser?.displayName else {
            print("nil username firebase service")
            return
        }
         User.username = username
         
    }
}

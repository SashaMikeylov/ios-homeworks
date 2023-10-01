//
//  Checker.swift
//  Navigation
//
//  Created by Денис Кузьминов on 24.07.2023.
//

import Foundation
import FirebaseAuth

enum CheckerErrors: Error {
    case notAuth
    case custom(reason: String)
}

protocol CheckerServiceProtocol {
    
    func checkCredentials(email: String,
                password: String,
                completion: @escaping(Bool) -> Void)
    
    func signUp(email: String,
                password: String,
                completion: @escaping (Bool) -> Void)

}


final class CheckerService: CheckerServiceProtocol {
    
    func checkCredentials(email: String, password: String, completion: @escaping (Bool) -> Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error == nil, authResult != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Bool) -> Void) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { authResul, error in
            if error == nil, authResul != nil {
                completion(true)
            } else {
                completion(false)
            }
        }
    }
}







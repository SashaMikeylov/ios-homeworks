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
    
    func signIn(email: String,
                password: String,
                completion: @escaping(Result <UserBone, CheckerErrors>) -> Void)
    
    func createUser(email: String,
                password: String,
                completion: @escaping (Result<UserBone, CheckerErrors>) -> Void)
    
//    func sighOut(completion: @escaping (Result<Void, CheckerErrors>) -> Void)
}


final class CheckerService: CheckerServiceProtocol {
    
    func signIn(email: String, password: String, completion: @escaping (Result<UserBone, CheckerErrors>) -> Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password) { (authdata, error) in
            if let error {
                completion(.failure(.custom(reason: error.localizedDescription)))
                return
            }
            guard let firUser = authdata?.user else {
                completion(.failure(.notAuth))
                return
            }
            
            let user = UserBone(filUser: firUser)
            completion(.success(user))
        }
    }
    
    func createUser(email: String, password: String, completion: @escaping (Result<UserBone, CheckerErrors>) -> Void) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) {authData, error in
            if let error {
                completion(.failure(.custom(reason: error.localizedDescription)))
                return
            }
            
            guard let firUser = authData?.user else {
                completion(.failure(.notAuth))
                return
            }
            
            let user = UserBone(filUser: firUser)
            completion(.success(user))
        }
    }
    
//    func sighOut(completion: @escaping (Result<Void, CheckerErrors>) -> Void) {
//        do {
//            try FirebaseAuth.Auth.auth().signOut()
//            completion(.success(()))
//        } catch {
//            completion(.failure(.custom(reason: error.localizedDescription)))
//        }
//    }
}







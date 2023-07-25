//
//  Checker.swift
//  Navigation
//
//  Created by Денис Кузьминов on 24.07.2023.
//

import Foundation

class Checker {
    
    static let shared = Checker()
    
    private let userLogin = "login"
    private let userPassword = "password"
    
    private init() {}
        
    
    
    func check(login: String, password: String) -> Bool {
        if (userLogin == login) && (userPassword == password) {
            return true
        }
        return false
    }
    
}

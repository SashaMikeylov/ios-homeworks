//
//  Checker.swift
//  Navigation
//
//  Created by Денис Кузьминов on 24.07.2023.
//

import Foundation

class Checker {
    
    static let shared = Checker()
    
    private let userLogin: String
    private let userPassword: String
    
    private init() {
        userLogin = User().user?.login ?? ""
        userPassword = "Waplolpop"
    }
    
    func check(login: String, password: String) -> Bool {
        if (userLogin == login) && (userPassword == password) {
            return true
        }
        return false
    }
    
}

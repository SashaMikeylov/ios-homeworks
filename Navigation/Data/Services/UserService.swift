//
//  User.swift
//  Navigation
//
//  Created by  on 20.07.2023.
//

import Foundation
import UIKit

protocol UserService {

    func searchUser(login: UserBody) -> UserBody?
}

//MARK: -Servise

class CurrentUserService: UserService {
    
    var user: UserBody
    
    
    init(user: UserBody) {
        self.user = user
    }
    
    func searchUser(login: UserBody) -> UserBody? {
        if login.login == user.login {
            return user
        }
        return nil
    }
}

class TestUserService: UserService {
    
    var user: UserBody

    init(user: UserBody) {
        self.user = user
    }
    
    func searchUser(login: UserBody) -> UserBody? {
        if login.login == user.login {
            return user
        }
        return nil
    }
}
    
    
    


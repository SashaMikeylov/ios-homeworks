//
//  User.swift
//  Navigation
//
//  Created by  on 20.07.2023.
//

import Foundation
import UIKit

protocol UserService {

    func searchUser(login: UserModel) -> UserModel?
}

//MARK: -Servise

class CurrentUserService: UserService {
    
    var user: UserModel
    
    
    init(user: UserModel) {
        self.user = user
    }
    
    func searchUser(login: UserModel) -> UserModel? {
        if login.login == user.login {
            return user
        }
        return nil
    }
}

class TestUserService: UserService {
    
    var user: UserModel

    init(user: UserModel) {
        self.user = user
    }
    
    func searchUser(login: UserModel) -> UserModel? {
        if login.login == user.login {
            return user
        }
        return nil
    }
}
    
    
    


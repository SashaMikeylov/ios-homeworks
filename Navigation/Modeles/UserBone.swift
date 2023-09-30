//
//  UserBone.swift
//  Navigation
//
//  Created by Денис Кузьминов on 29.09.2023.
//

import Foundation
import FirebaseAuth

struct UserBone {
    let email: String
    let name: String
    
    init(filUser: User) {
        self.email = filUser.email ?? ""
        self.name = filUser.displayName ?? ""
    }
}

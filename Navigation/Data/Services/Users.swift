//
//  Users.swift
//  Navigation
//
//  Created by Денис Кузьминов on 21.07.2023.
//

import Foundation
import UIKit

//MARK: -users
let userDebug = UserBody(login: "Swap",
                         fullName: "Alexander",
                         avatar: UIImage(named: "Avatar-1")!,
                         status: "I am sleeping")

let userRealese = UserBody(login: "SwaPPer",
                         fullName: "Victor",
                         avatar: UIImage(named: "Avatar-2")!,
                         status: "Checking...")


class User {
    
    #if DEBUG
    let user = TestUserService(user: userDebug).searchUser(login: userDebug)
    #else
    let user = CurrentUserService(user: userRealese).searchUser(login: userRealese)
    #endif
    
}

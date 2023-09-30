//
//  Users.swift
//  Navigation
//
//  Created by Денис Кузьминов on 21.07.2023.
//

import Foundation
import UIKit

//MARK: -users
let userDebug = UserModel(login: "Swap",
                         fullName: "Alexander",
                         avatar: UIImage(named: "Avatar-1")!,
                         status: "I am sleeping")

let userRealese = UserModel(login: "SwaPPer",
                         fullName: "Victor",
                         avatar: UIImage(named: "Avatar-2")!,
                         status: "Checking...")


class UserBody {
    
    #if DEBUG
    let user = CurrentUserService(user: userDebug).searchUser(login: userDebug)
    #else
    let user = CurrentUserService(user: userRealese).searchUser(login: userRealese)
    #endif
    
}

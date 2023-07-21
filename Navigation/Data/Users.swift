//
//  Users.swift
//  Navigation
//
//  Created by Денис Кузьминов on 21.07.2023.
//

import Foundation
import UIKit


     
let userDebug = UserBody(login: "Spn",
                         fullName: "Alexander",
                         avatar: UIImage(named: "Avatar-1")!,
                         status: "I am sleeping")
    
let userRealese = UserBody(login: "SwaPPer",
                         fullName: "Victor",
                         avatar: UIImage(named: "Avatar-2")!,
                         status: "Checking...")
    



class User {
    #if DEBUG
    let user = CurrentUserService(user: userDebug).searchUser(login: userDebug)
    #else
    let user = CurrentUserService(user: .userRealese).searchUser(login: userRealese)
    #endif
}

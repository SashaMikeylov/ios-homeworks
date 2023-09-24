//
//  LoginFactory.swift
//  Navigation
//
//  Created by Денис Кузьминов on 24.07.2023.
//

import Foundation


protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}


struct MyLoginFactory: LoginFactory {
    
    
    func makeLoginInspector() -> LoginInspector {
        let loginInspector = LoginInspector()
        return loginInspector
    }

    
    
}

//
//  LocalAuthorizationService.swift
//  Navigation
//
//  Created by Денис Кузьминов on 24.12.2023.
//

import Foundation
import LocalAuthentication
import UIKit

//MARK: - LocalAuthorizationService

final class LocalAuthorizationService {
    
    private var context = LAContext()
    private var error: NSError? = nil
    
    static let shared = LocalAuthorizationService()
    
    private init(){}
    
    //MARK: - Authorize checker
    
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool) -> Void) {
        let isAvaibled = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error)
        
        if let error {
            print(error.localizedDescription)
            authorizationFinished(false)
        }
        
        isAvaibled ? print("yes") : print("no")
        authorizationFinished(true)
    }
    
    //MARK: - Checker for viewControllers
    
    func checkForViewControler(_ coordinator: FirstFlowCoordinator?) {
        context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Touch id") { isSuccess, error in
            if let error {
                print(error.localizedDescription)
                
            }
            if isSuccess {
                DispatchQueue.main.async {
                    coordinator?.showProfile()
                }
            }
        }
    }
    
    
}

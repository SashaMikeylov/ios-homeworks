//
//  FirstFlowCoordinator.swift
//  Navigation
//
//  Created by Денис Кузьминов on 02.09.2023.
//

import Foundation
import UIKit

final class FirstFlowCoordinator {
    
    var navController: UINavigationController?
    
    func showProfile(){
        let profileViewController = FactoryControllers(flow: .profile).profileViewController
        guard let profileViewController = profileViewController else {return }
        navController?.pushViewController(profileViewController, animated: true)
    }
}

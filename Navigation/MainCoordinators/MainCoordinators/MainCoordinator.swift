//
//  MainCoordinator.swift
//  Navigation
//
//  Created by Денис Кузьминов on 31.08.2023.
//

import Foundation
import UIKit

protocol MainCoordinator {
    func startApplication() -> UIViewController
}

// Main Coordinator

final class MainCoordinatorImp: MainCoordinator {
    
    
    func startApplication() -> UIViewController {
        return MainTabBarCoordinator()
    }
    
   
    
    
}

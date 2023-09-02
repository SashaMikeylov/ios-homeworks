//
//  MainTabBarCoordinator.swift
//  Navigation
//
//  Created by Денис Кузьминов on 31.08.2023.
//

import Foundation
import UIKit

final class MainTabBarCoordinator: UITabBarController {
    
    private let feedViewControler = FactoryControllers(flow: .feed)
    private let loginViewController = FactoryControllers(flow: .login)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .systemGray5
        setViewControllers()
    }
    
    private func setViewControllers(){
        viewControllers = [feedViewControler.navigationController, loginViewController.navigationController]
    }
}

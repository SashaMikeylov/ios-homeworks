//
//  FactoryControllers.swift
//  Navigation
//
//  Created by Денис Кузьминов on 31.08.2023.
//

import Foundation
import UIKit


final class FactoryControllers {
    
    enum Flow {
        case feed
        case login
        case profile
        case favorites
    }
    
    private let flow: Flow
    private(set) var navigationController = UINavigationController()
    private(set) var profileViewController: UIViewController?
    
    private func startAplication(){
        
        switch flow {
            
        case .feed:
            let feedViewController = FeedViewController()
            feedViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
            navigationController.setViewControllers([feedViewController], animated: true)
            navigationController.title = "News"
            
        case .login:
            let firstFlowCoordinator = FirstFlowCoordinator()
            let logInViewController = LogInViewController()
            logInViewController.coordinator = firstFlowCoordinator
            firstFlowCoordinator.navController = navigationController
            logInViewController.loginDelegate = MyLoginFactory().makeLoginInspector()
            logInViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1)
            navigationController.setViewControllers([logInViewController], animated: true)
            
        case .profile:
            let profileViewControllers = ProfileViewController()
            profileViewController = profileViewControllers
            
        case .favorites:
            let favoritesViewController = FavoritePostsViewControllerL()
            favoritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
            navigationController.setViewControllers([favoritesViewController], animated: true)
        }
    }
    
    init(flow: Flow) {
        self.flow = flow
        startAplication()
    }
    
}

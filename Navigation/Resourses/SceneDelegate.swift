//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Денис Кузьминов on 08.05.2023.
//

import UIKit
import FirebaseAuth

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: scene)
       


        window.rootViewController = MainCoordinatorImp().startApplication()

        window.makeKeyAndVisible()
        self.window = window
        
      //  var appConfiguration = AppConfiguration.people
        
//        let random = Int.random(in: 0 ... 2)
//        switch random {
//        case 0: appConfiguration = .people
//        case 1: appConfiguration = .planets
//        case 2: appConfiguration = .starships
//        default: break
//        }
        
      //  NetworkService.requst(config: appConfiguration)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
        do {
           try FirebaseAuth.Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}


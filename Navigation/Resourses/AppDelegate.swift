//
//  AppDelegate.swift
//  Navigation
//
//  Created by Денис Кузьминов on 08.05.2023.
//

import UIKit
import FirebaseCore
import CoreData
import UserNotifications

@main class AppDelegate: UIResponder, UIApplicationDelegate {
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Thread.sleep(forTimeInterval: 1)
        LocalNotificationsService().request()
        LocalNotificationsService().registeForLatestUpdatesIfPossible()

        return true
    }
    

    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
//    lazy var persistentContainer: NSPersistentContainer = {
//        let container = NSPersistentContainer(name: "Navigation")
//        container.loadPersistentStores { description, error in
//            if let error {
//                print(error.localizedDescription)
//            } else {
//                print("Url data base ----", description.url)
//            }
//        }
//        return container
//    }()

//    func saveContext() {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let error = error as? NSError
//                fatalError(error!.localizedDescription)
//            }
//        }
//    }
//}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.badge, .banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("Message")
    }
}

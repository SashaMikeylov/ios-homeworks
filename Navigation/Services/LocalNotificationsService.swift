//
//  LocalNotificationsService.swift
//  Navigation
//
//  Created by Денис Кузьминов on 22.12.2023.
//

import Foundation
import UserNotifications

//MARK: - LocalNotificationsService

final class LocalNotificationsService {
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    //MARK: - Request
    
    func request() {
        notificationCenter.requestAuthorization(options: [.badge, .sound, .provisional]) { isSuccess, error in
            guard isSuccess else {return}
            self.notificationCenter.getNotificationSettings { settings in
                print(settings)
                guard settings.authorizationStatus == .authorized else {return}
            }
        }
    }
    
    //MARK: - Register
    
    func registeForLatestUpdatesIfPossible() {
        
        let content = UNMutableNotificationContent()
        content.title = "Посмотрите последние обновления"
        content.sound = UNNotificationSound.default
        var date = DateComponents()
        date.hour = 19
        date.minute = 00
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: true)
        let reuest = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
        notificationCenter.add(reuest) { error in
            print(error?.localizedDescription ?? "")
        }
    }
}

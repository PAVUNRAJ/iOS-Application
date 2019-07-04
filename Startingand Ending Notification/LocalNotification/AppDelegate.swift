//
//  AppDelegate.swift
//  LocalNotification
//
//  Created by Debash on 05.06.2018.
//  Copyright © 2018 swiftbook.ru. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let notificationCenter = UNUserNotificationCenter.current()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {(accepted, error) in
//            if !accepted {
//                print("Notification access denied.")
//            }
//        }
//
//        let action = UNNotificationAction(identifier: "remindLater", title: "Remind me later", options: [])
//        let category = UNNotificationCategory(identifier: "myCategory", actions: [action], intentIdentifiers: [], options: [])
        //UNUserNotificationCenter.current().setNotificationCategories([category])

        notificationCenter.delegate = self
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                print("User has declined notifications")
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        
        UIApplication.shared.applicationIconBadgeNumber = 0
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension AppDelegate: UNUserNotificationCenterDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        completionHandler([.alert, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.notification.request.identifier == "Local Notification" {
            print("Handling notifications with the Local Notification Identifier")
        }
        
        completionHandler()
    }
    
    func scheduleNotification(at date: Date,notificationType: String) {
        
        let content = UNMutableNotificationContent()
        let categoryIdentifire = "Delete Notification Type"
        
        content.title = notificationType
        content.body = "PavunRaj is sent How Are You! " + notificationType
        content.sound = UNNotificationSound.default
        content.badge = 1
        content.categoryIdentifier = categoryIdentifire
        let calendar = Calendar(identifier: .indian)
        let components = calendar.dateComponents(in: .current, from: date)
     //   print("iwill",components)
        //        let imageName = "applelogo"
        //        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        //        print("imageURL",imageURL)
        //print("date with time",components.day,components.hour,components.minute)
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        //        print("calendarsss",calendar)
//        let identifier = ProcessInfo.processInfo.globallyUniqueString
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: true)
      //  print("trigger",trigger)
        //let trigger1 = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //let identifier = "Local Notification"
        let request = UNNotificationRequest(identifier: dateFormatter.string(from: date), content: content, trigger: trigger)
        
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Error \(error.localizedDescription)")
            }
        }
        
        let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
        let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
        let category = UNNotificationCategory(identifier: categoryIdentifire,
                                              actions: [snoozeAction, deleteAction],
                                              intentIdentifiers: [],
                                              options: [])
        
        notificationCenter.setNotificationCategories([category])
    }
}

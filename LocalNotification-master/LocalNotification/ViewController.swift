//
//  ViewController.swift
//  Notification
//
//  Created by 10decoders on 02/07/19.
//  Copyright © 2019 10decoders. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    let formatter = DateFormatter()
    var app = AppDelegate()
    @IBOutlet weak var labeldate: UILabel!
    
    @IBOutlet weak var labeltime: UILabel!
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
//        UNUserNotificationCenter.current().delegate = self
      datePicker?.datePickerMode = .time
//        createDate(day: 1, month : 1, hour: 04, minute: 14, year: 1948)
    }
    
    
//func createDate(day: Int, month : Int, hour: Int, minute: Int, year: Int)->Date{
//
//        var components = DateComponents()
//        components.hour = hour
//        components.minute = minute
//        components.year = year
//        components.day = day
//        components.month = month
//
//        components.timeZone = .current
//    print("pavun",components.timeZone)
//
//        let calendar = Calendar(identifier: .gregorian)
//         print("--------------",calendar)
//        return calendar.date(from: components)!
//
//    }

    @IBAction func ValueChnage(_ sender: UIDatePicker) {
        labeltime?.text = formatter.string(from:sender.date)
        print("data",sender.date)
        self.appDelegate?.scheduleNotification(at: sender.date, notificationType: "Shedule time Notification")
//        app.scheduleNotification(at: sender.date, titles: "Tiktok", identifierUnic: "ygy", body: "Notification Section")
//        app.scheduleNotification(at: sender.date, title: "sdacas", body: "sdss", id: "saxsacsacs")

    }
    
        
       
    }



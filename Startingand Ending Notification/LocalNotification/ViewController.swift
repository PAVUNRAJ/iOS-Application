//
//  ViewController.swift
//  Notification1
//
//  Created by 10decoders on 03/07/19.
//  Copyright © 2019 10decoders. All rights reserved.
//
// pavun it's working snooze notification
import UIKit
import  UserNotifications
import NotificationCenter
class ViewController: UIViewController {
    
    let app = AppDelegate()
    let date = Date()
    
    var s:Date? = nil
    var b:Date? = nil
    @IBOutlet weak var Settime: UILabel!
    
    @IBOutlet weak var Endtime: UILabel!
    // let datePicker = UIDatePicker()
    
    @IBOutlet weak var Starttime: UITextField!
    
    
    @IBOutlet weak var Endingtime: UITextField!
    
    
    @IBAction func OkButton(_ sender: Any) {
        if (s != nil && b != nil) {
            
            let snoozeTimes = s!.adding(minute:2)
             app.scheduleNotification(at: s!, notificationType: "Starting time notification")
             app.scheduleNotification(at: b!, notificationType: "End time notification")
            if(snoozeTimes < b!)
            {

                for i in 0..<5 {
                    
                    let snoozeTime = s!.adding(minute: 2*i)
                    if snoozeTime < b! {
                        
                       // print("S----------",s!)
                        print("b--------",b!)
                        //b!
                         app.scheduleNotification(at: snoozeTime, notificationType: "Starting time notification")
                        print("snooz",snoozeTime)
                     //  app.scheduleNotification(at: snoozeTime, notificationType: "Ending time notification")
                        
                    }
                    
                }
            }
            else{
                // create the alert
                let alert = UIAlertController(title: "Sorry", message: "Enter above 2 minutes from start time", preferredStyle: UIAlertController.Style.alert)
                
                // add an action (button)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                
                // show the alert
                self.present(alert, animated: true, completion: nil)
             //   print("sotrryu")
            }
        }

    }
        
    
    var dateFormatter : DateFormatter!
    
    let datePicker = UIDatePicker();
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker()
        
    }
    
    
    func createDatePicker(){
        
        //format for datepicker display
        datePicker.datePickerMode = .time
        
        //assign datepicker to our textfield
        Starttime.inputView = datePicker
        //format for datepicker display
        
        
        //assign datepicker to our textfield
        Endingtime.inputView = datePicker
        
        //create a toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let tolbar = UIToolbar()
        tolbar.sizeToFit()
        
        //add a done button on this toolbar
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        
        toolbar.setItems([doneButton], animated: true)
        
        Starttime.inputAccessoryView = toolbar
        let OKButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicke))
        tolbar.setItems([OKButton], animated: true)
        
        Endingtime.inputAccessoryView = tolbar
        print(Endingtime)
    }
    func notification(Date:Date){
       // print("Date")
        let center = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        //content.title = "Remainder"
        //content.body = "vignesh you  set  a  Notification"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .medium
        let calendar = Calendar(identifier: .indian)
        let components = calendar.dateComponents(in: .current, from: Date)
        
        let newComponents = DateComponents(calendar: calendar, timeZone: .current, month: components.month, day: components.day, hour: components.hour, minute: components.minute)
        let trigger = UNCalendarNotificationTrigger(dateMatching: newComponents, repeats: false)
        
        let request = UNNotificationRequest(identifier: dateFormatter.string(from: Date),content: content, trigger:trigger)
        center.add(request) {(error) in
            if error != nil {
                print("error local notification")
                
            }
        }
    }
    @objc func doneClicked(){
        
        //format for displaying the date in our textfield
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        s = datePicker.date
        Starttime.text = dateFormatter.string(from: s!)
        self.view.endEditing(true)
        //        dateLabel.text = pickerString
        
        print("sarting time",s!)
        
        //print("sarting time")
        
    }
    @objc func doneClicke(){
        
        //format for displaying the date in our textfield
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        b = datePicker.date
        
        Endingtime.text = dateFormatter.string(from: b!)
        self.view.endEditing(true)
        print("Ending time ",b!)
    }
    
}

extension Date {
    func adding(minute: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minute, to: self)!
    }
    
}




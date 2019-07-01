//
//  ViewController.swift
//  Json
//
//  Created by 10decoders on 29/06/19.
//  Copyright © 2019 10decoders. All rights reserved.
//

import UIKit

struct Course {
    let id: Int
     let firstname: String?
     let lastname: String?
     let email: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      let jsonurl = "https://www.json-generator.com/api/json/get/bVlYLroqPS?indent=2"
        guard let url = URL(string: jsonurl) else{
            return
        }
//     let mycourse = Course(id: 1, firstname: "Pavun", lastname: "Raj", email: "pavunraj06@1odecoders.in")
        
        URLSession.shared.dataTask(with: url) { (data, responce, err) in
            print("it's work ")
            guard let data = data else{
                return
            }
            
            do{
                let json =  try! JSONSerialization.jsonObject(with: data, options:.mutableContainers)
                print(json)
            }
            catch let jsonerr{
                print("this is error json serializtion",jsonerr)

            }
//           let datasharing = String(data: data,encoding : .utf8)
//            print(datasharing)
        }.resume()
      //  print(mycourse)
    //let myjson = JSONDecoder(
    


    }
}

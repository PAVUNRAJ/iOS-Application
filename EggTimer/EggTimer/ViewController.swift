//
//  ViewController.swift
//  EggTimer
//
//  Created by Tech on 23/08/20.
//  Copyright © 2020 pavun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var titlelabel: UILabel!
    @IBOutlet var processBar: UIProgressView!
    var timer = Timer()
    var secondspeed = 0
    var totaltime = 0
    var eggtype = ["soft": 3 ,"Medium": 5,"hard": 8]
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBAction func hardegg(_ sender: UIButton) {
        print("sender",sender.currentTitle)
        var buttontype = sender.currentTitle!
        processBar.progress = 0.0
        secondspeed = 0
        titlelabel.text = buttontype
        
        timer.invalidate()
        totaltime = eggtype[buttontype]!
        print("totaltime",totaltime)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(processing), userInfo: nil, repeats: true)
        
    }
    @objc func processing(){
        
        if secondspeed < totaltime{
            secondspeed += 1
            var handling  = Float(secondspeed) / Float(totaltime)

            print("handling",handling)
            processBar.progress = handling
        }
        else{
            timer.invalidate()
            titlelabel.text = "Done"
        }
    }
}


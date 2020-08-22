//
//  ViewController.swift
//  PlaySound
//
//  Created by Tech on 22/08/20.
//  Copyright © 2020 pavun. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audio: AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playsound(_ sender: Any) {
        playsound()
    }
    
    func playsound(){
        
        
            guard let url = Bundle.main.url(forResource: "message_tone", withExtension: "mp3") else { return }

            do {
                try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                try AVAudioSession.sharedInstance().setActive(true)

                /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
                audio = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

                /* iOS 10 and earlier require the following line:
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

                guard let player = audio else { return }

             player.play()

            } catch let error {
                print(error.localizedDescription)
            }
        
    }
}


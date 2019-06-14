//
//  Secondview.swift
//  Helloteam
//
//  Created by 10decoders on 14/06/19.
//  Copyright © 2019 10decoders. All rights reserved.
//

import UIKit

class Secondview: UIViewController {

    @IBAction func back(_ sender: Any) {
        let main = UIStoryboard (name: "Main", bundle: nil)
        let first = main.instantiateViewController(withIdentifier:"click")
        self.present(first,animated:true,completion: nil )
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

   
    
}

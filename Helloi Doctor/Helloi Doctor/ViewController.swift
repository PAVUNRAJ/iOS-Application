

import UIKit

class ViewController: UIViewController {

    @IBOutlet var username: UITextField!
    var name:String =  ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func Done(_ sender: Any) {
        let raj = storyboard?.instantiateViewController(withIdentifier: "id") as! SigninViewController
         raj.namepassed = username.text!
   navigationController?.pushViewController(raj, animated:true)

    }
    
}


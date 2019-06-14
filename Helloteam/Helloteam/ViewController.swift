

import UIKit

class ViewController: UIViewController {

    @IBAction func submit(_ sender: Any) {
        let main = UIStoryboard (name: "Main", bundle: nil)
        let seconds = main.instantiateViewController(withIdentifier:"clickf")
        self.present(seconds,animated:true,completion: nil )
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


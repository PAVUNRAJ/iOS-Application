

import UIKit

class SigninViewController: UIViewController
{
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
      viewName.text = namepassed
    }
    
    
@IBOutlet weak var viewName: UILabel!
      var namepassed = ""
   

    @IBAction func button(_ sender: Any) {
       
    }
    
}





import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
     var nameText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func done(_ sender: Any) {
    self.nameText  = textField.text!
        performSegue(withIdentifier: "name", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue .destination as! NameViewController
        vc.finalName = self.nameText
    }
}




import UIKit
class NameViewController: UIViewController {
    var finalName = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = finalName
        
    }
    

    

}

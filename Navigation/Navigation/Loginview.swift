import Foundation
import UIKit
class Loginviewcontroller:UIViewController{
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func login(_ sender: Any) {
        navigatenmainapplication()
    }
    func navigatenmainapplication(){
        let userdatials = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard  let loginviewisconsist = userdatials.instantiateViewController(withIdentifier: "mainapplication") as? Mainapplication else{
            return
        }
//        print(loginviewisconsist.topViewController)
//        print(loginviewisconsist.viewControllers)
        if let mainvc = loginviewisconsist.topViewController as? ViewController{
            
            mainvc.userName = username.text
        }
        present(loginviewisconsist, animated:true, completion: nil)
    }
}



import UIKit

class TableViewlistController: UIViewController {
    var name = ["FCX Clarity"]

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
}
extension TableViewlistController: UITabBarDelegate,UITableViewDataSource    {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: <#T##IndexPath#>) as? TableViewlistController
         return cell!       
    }
    
        
        func  tableView( _ tableView : UITableView, numberOfRowsInSection Section:Int ) ->Int{
            return name.count

    }

    

}

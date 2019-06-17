
import UIKit

class TableViewController: UIViewController ,UITabBarDelegate,UITableViewDataSource{
    let list = ["Abraxane","Adriamycin","carboplatin","Cytoxan","daunorubicin"]


    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return(list.count)
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
   
        let cell = tableView.dequeueReusableCell(withIdentifier: "table", for: indexPath) as! DashboardFeelingTableViewCell
        table.textLabel?.text   = list[indexPath.row]
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

}



import UIKit
//import  SwiftyJSON
class ForecastCell: UITableViewCell {
    
    @IBOutlet weak var forecastTemp: UILabel!
    @IBOutlet weak var forecastDay: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
        func configureCell(forecastData: ForecastWeather) {
        self.forecastDay.text = "\(forecastData.date)"
        self.forecastTemp.text = "\(Int(forecastData.temp))"
        
    }
    
}
//}
    //"http://api.openweathermap.org/data/2.5/weather?q=Chennai,in&APPID=4468bca1fe9bf0fdc986c9cd103c2f66"

//}

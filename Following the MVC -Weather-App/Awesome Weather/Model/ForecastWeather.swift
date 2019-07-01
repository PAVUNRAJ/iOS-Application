

import Foundation

class ForecastWeather {
    private var _date: String!
    private var _temp: Double!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    
    
    var temp: Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
     //print(_temp)
    }
//}
    init(weatherDict: Dictionary<String, AnyObject>) {
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject> {
            if let dayTemp = temp["day"] as? Double {
                let rawValue = (dayTemp - 273.15).rounded(toPlaces: 0)
                self._temp = rawValue
                
                //print(_temp)
            }
            
        }
        if let date = weatherDict["dt"] as? Double {
            
            let rawDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            
            self._date = "\(rawDate.dayOfTheWeek())"
            
            //print(_date)
        }
        
    }
//}}
}

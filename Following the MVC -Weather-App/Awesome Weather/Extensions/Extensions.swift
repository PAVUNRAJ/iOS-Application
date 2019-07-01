//
//  Extensions.swift
//  Awesome Weather
//

//  Created by 10decoders on 01/07/19.
//  Copyright © 2019 10decoders. All rights reserved.
//



import Foundation
extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

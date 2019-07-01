//
//  Extras.swift
//  Weather
//
//  Created by 10decoders on 01/07/19.
//  Copyright © 2019 10decoders. All rights reserved.
//
//pavun

import Foundation

let API_URL = "http://api.openweathermap.org/data/2.5/weather?q=Chennai,in&APPID=4468bca1fe9bf0fdc986c9cd103c2f66"
let FORECAST_API_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=8&appid=7c609f73c5df2dff2f32e3e3cc33cd23"
//let FORECAST_API_URL = "http://api.openweathermap.org/data/2.5/weather?q=Chennai,in&APPID=4468bca1fe9bf0fdc986c9cd103c2f66"


typealias DownloadComplete = () -> ()


//
//  WeatherData.swift
//  Clima
//
//  Created by 김지호 on 2021/05/04.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData : Codable {
    var name : String
    var cod : Int
    let main : Main
    let weather : [weather]
}

struct Main : Codable{
    let temp : Double
}

struct weather : Codable{
    let id : Int
}

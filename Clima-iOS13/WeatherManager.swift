//
//  WeatherManager.swift
//  Clima
//
//  Created by 김지호 on 2021/05/04.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol WeatherDelegate {
    func didUpdateWeather(_ weatherManager : WeatherManager ,weather: WeatherModel)
    func didFailWithError(error : Error)
    
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=57d7a34fced50f8c158be34bacb18eac&units=metric"
    
    var delegate : WeatherDelegate?
    
    // 날씨 api 호출 시 필요한 파라미터 받는 함수
    func fetchWeather(cityName : String)  {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("\(urlString)")
        performRequest(with:urlString)
    }
    func fetchWeather(latitude: CLLocationDegrees , longitude : CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    // api 네트워크 파트
    func performRequest(with urlString : String)  {
        // 1. Create URL
        if let url = URL(string: urlString) {
            
            // 2. Create UrlSession
            let session = URLSession(configuration: .default)
            // 3. give URLSession a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if let safeData = data {
                    
                    // 디버깅용
                    let dataString = String(data: safeData , encoding: .utf8)
                    print(dataString!)// JSON 출력함
                    //
                    
                    if let weather : WeatherModel = self.parseJSON(safeData){
                        delegate?.didUpdateWeather(self, weather: weather)
                    }
                    
                }
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
            }
            // 4. task
            task.resume()
        }
    }
    // 호출된 데이터를 디코딩후 현재 호출한 날씨인스턴스로 리턴
    func parseJSON(_ weatherData : Data) -> WeatherModel?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].id)
            let id  = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            print ("conditionName : \(weather.conditionName)")
            print("temp : \(weather.temperatureString)")
            return weather
        }catch{
            
            print(error)
            return nil
        }
    }
    
    //    func getWeatherImage(weatherId : Int) -> String{
    //        switch weatherId {
    //                case 200...232:
    //                    return "cloud.bolt"
    //                case 300...321:
    //                    return "cloud.drizzle"
    //                case 500...531:
    //                    return "cloud.rain"
    //                case 600...622:
    //                    return "cloud.snow"
    //                case 701...781:
    //                    return "cloud.fog"
    //                case 800:
    //                    return "sun.max"
    //                case 801...804:
    //                    return "cloud.bolt"
    //                default:
    //                    return "cloud"
    //                }
    //
    //    }
}

//    func handler(data: Data? , response: URLResponse? , error: Error?) {
//        if let safeData = data {
//            let dataString = String(data: safeData , encoding: .utf8)
//            print(dataString!)
//        }
//        if error != nil {
//            print(error!)
//            return
//        }
//
//    }


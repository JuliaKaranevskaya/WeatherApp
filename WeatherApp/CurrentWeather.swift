//
//  CurrentWeather.swift
//  WeatherApp
//
//  Created by Юлия Караневская on 1.09.21.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    
    let temp: Double
    var tempString: String {
        return "\(temp.rounded())"
    }
    
    let feelsLikeTemp: Double
    var feelsLikeTempString: String {
        return "\(feelsLikeTemp.rounded())"
    }
    
    let weatherPicture: Int
    var weatherPictureString: String {
        switch weatherPicture {
        case 200...232:
            return "cloud"
        case 300...321:
            return "cloud.fill"
        case 500...531:
            return "sun.min"
        case 200...232:
            return "cloud.sun"
        case 200...232:
            return "cloud.sun.bolt"
        default:
            return "sun.haze.fill"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temp = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feels_like
        weatherPicture = currentWeatherData.weather.first?.id ?? 1
    }
}

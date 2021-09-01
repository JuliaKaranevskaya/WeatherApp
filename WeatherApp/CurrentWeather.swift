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
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temp = currentWeatherData.main.temp
        feelsLikeTemp = currentWeatherData.main.feels_like
        weatherPicture = currentWeatherData.weather.first?.id ?? 1
    }
}

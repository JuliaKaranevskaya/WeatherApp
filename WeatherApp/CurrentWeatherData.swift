//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Юлия Караневская on 1.09.21.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather] 
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
}

struct Weather: Codable {
    let id: Int
}

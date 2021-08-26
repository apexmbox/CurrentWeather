//
//  CurrentWeather.swift
//  CurrentWeather
//
//  Created by Apex on 25.08.2021.
//

import Foundation

struct CurrentWeather {
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return String(format: "%.0f", temperature)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    
    let conditionCode: Int
    var iconWeatherEmoji: String {
        switch conditionCode {
        case 200...232: return "⛈"
        case 300...321: return "🌦"
        case 500...531: return "🌧"
        case 600...622: return "🌨"
        case 701...781: return "🌥"
        case 800: return "☀️"
        case 801...804: return "☁️"
        default: return "🌎"
        }
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelsLikeTemperature = currentWeatherData.main.feelsLike
        conditionCode = currentWeatherData.weather.first!.id
    }
}

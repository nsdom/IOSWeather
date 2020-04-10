//
//  WeatherCall.swift
//  IOSWeather
//
//  Created by Nicola on 10/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct WeatherCall: Codable {
    public var lat: Double?
    public var lon: Double?
    public var timezone: String?
    public var current: Current?
    public var hourly: [Hourly]?
    public var daily: [Daily]?
    
    // MARK: - CurrentWeather
    
    public struct Current: Codable {
        public var dt: Int?
        public var sunrise: Int?
        public var sunset: Int?
        public var temp: Double?
        public var feelsLike: Double?
        public var pressure: Int?
        public var humidity: Int?
        public var dewPoint: Double?
        public var uvi: Double?
        public var clouds: Int?
        public var visibility: Int?
        public var windSpeed: Double?
        public var windDeg: Int?
        public var weather: [Weather]?
        public var rain: Rain?
        
        enum CodingKeys: String, CodingKey {
            case dt
            case sunrise
            case sunset
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
            case dewPoint = "dew_point"
            case uvi
            case clouds
            case visibility
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case weather
            case rain
            
        }
    }
    
    // MARK: - HourlyWeather
    
    public struct Hourly: Codable {
        public var dt: Int?
        public var temp: Double?
        public var feelsLike: Double?
        public var pressure: Int?
        public var humidity: Int?
        public var clouds: Int?
        public var windSpeed: Double?
        public var windDeg: Int?
        public var weather: [Weather]?
        public var rain: Rain?
        
        enum CodingKeys: String, CodingKey {
            case dt
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
            case clouds
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case weather
            case rain
        }
    }
    
    // MARK: - DailyWeather
    
    public struct Daily: Codable {
        public var dt: Int?
        public var sunrise: Int?
        public var sunset: Int?
        public var temp: Temp?
        public var feelsLike: FeelsLike?
        public var pressure: Int?
        public var humidity: Int?
        public var windSpeed: Double?
        public var windDeg: Int?
        public var weather: [Weather]?
        public var clouds: Int?
        public var rain: Double?
        public var uvi: Double?
        
        enum CodingKeys: String, CodingKey {
            case dt
            case sunrise
            case sunset
            case temp
            case feelsLike = "feels_like"
            case pressure
            case humidity
            case windSpeed = "wind_speed"
            case windDeg = "wind_deg"
            case weather
            case clouds
            case rain
            case uvi
        }
    }
}

// MARK: - WeatherTypes

public struct Weather: Codable {
    public var id: Int?
    public var main: String?
    public var description: String?
    public var icon: String?
}

public struct Rain: Codable {
    public var oneHour: Double?
    
    enum CodingKeys: String, CodingKey {
        case oneHour = "1h"
    }
}

public struct Temp: Codable {
    public var day: Double?
    public var min: Double?
    public var max: Double?
    public var night: Double?
    public var eve: Double?
    public var morn: Double?
}

public struct FeelsLike: Codable {
    public var day: Double?
    public var night: Double?
    public var eve: Double?
    public var morn: Double?
}

//
//  CurrentWeatherViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 10/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct CurrentWeatherViewModel {
    
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
           public var weather: [WeatherViewModel]?
           public var rain: RainViewModel?
    
    public init(currentResult: WeatherCall.Current) {
        self.dt = currentResult.dt
        self.sunrise = currentResult.sunrise
        self.sunset = currentResult.sunset
        self.temp = currentResult.temp
        self.feelsLike = currentResult.feelsLike
        self.pressure = currentResult.pressure
        self.humidity = currentResult.humidity
        self.dewPoint = currentResult.dewPoint
        self.uvi = currentResult.uvi
        self.clouds = currentResult.clouds
        self.visibility = currentResult.visibility
        self.windSpeed = currentResult.windSpeed
        self.windDeg = currentResult.windDeg
        self.weather = [WeatherViewModel(
            id: currentResult.weather?.first?.id,
            main: currentResult.weather?.first?.main,
            description: currentResult.weather?.first?.description,
            icon: currentResult.weather?.first?.icon
            )]
        self.rain = RainViewModel(oneHour: currentResult.rain?.oneHour)
    }

}

public struct WeatherViewModel {
public var id: Int?
public var main: String?
public var description: String?
public var icon: String?

}

public struct RainViewModel {
    public var oneHour: Double?

}

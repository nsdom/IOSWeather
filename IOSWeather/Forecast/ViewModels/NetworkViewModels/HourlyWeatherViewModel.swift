//
//  HourlyWeatherViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 10/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct HourlyWeatherViewModel {
    public var dt: Int?
    public var temp: Double?
    public var feelsLike: Double?
    public var pressure: Int?
    public var humidity: Int?
    public var clouds: Int?
    public var windSpeed: Double?
    public var windDeg: Int?
    public var weather: [WeatherViewModel]?
    public var rain: RainViewModel?
    
    public init(hourlyResult: [WeatherCall.Hourly]) {
        self.dt = hourlyResult.first?.dt
        self.temp = hourlyResult.first?.temp
        self.feelsLike = hourlyResult.first?.feelsLike
        self.pressure = hourlyResult.first?.pressure
        self.humidity = hourlyResult.first?.humidity
        self.clouds = hourlyResult.first?.clouds
        self.windSpeed = hourlyResult.first?.windSpeed
        self.windDeg = hourlyResult.first?.windDeg
        self.weather = [WeatherViewModel(
            id: hourlyResult.first?.weather?.first?.id,
            main: hourlyResult.first?.weather?.first?.main,
            description: hourlyResult.first?.weather?.first?.description,
            icon: hourlyResult.first?.weather?.first?.icon
        )]
        self.rain = RainViewModel(oneHour: hourlyResult.first?.rain?.oneHour)
    }
}

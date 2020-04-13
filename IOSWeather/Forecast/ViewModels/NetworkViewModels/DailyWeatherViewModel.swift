//
//  DailyWeatherViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 10/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct DailyWeatherViewModel {
    public var dt: Int?
    public var sunrise: Int?
    public var sunset: Int?
    public var temp: TempViewModel?
    public var feelsLike: FeelsLikeViewModel?
    public var pressure: Int?
    public var humidity: Int?
    public var windSpeed: Double?
    public var windDeg: Int?
    public var weather: [WeatherViewModel]?
    public var clouds: Int?
    public var rain: Double?
    public var uvi: Double?

    public init(dailyResult: WeatherCall.Daily) {
        self.dt = dailyResult.dt
        self.sunrise = dailyResult.sunrise
        self.sunset = dailyResult.sunset
        self.temp = TempViewModel(
            day: dailyResult.temp?.day,
            min: dailyResult.temp?.min,
            max: dailyResult.temp?.max,
            night: dailyResult.temp?.night,
            eve: dailyResult.temp?.eve,
            morn: dailyResult.temp?.morn
        )
        self.feelsLike = FeelsLikeViewModel(
            day: dailyResult.feelsLike?.day,
            night: dailyResult.feelsLike?.night,
            eve: dailyResult.feelsLike?.eve,
            morn: dailyResult.feelsLike?.morn
        )
        self.pressure = dailyResult.pressure
        self.humidity = dailyResult.humidity
        self.windSpeed = dailyResult.windSpeed
        self.windDeg = dailyResult.windDeg
        self.weather = [WeatherViewModel(
            id: dailyResult.weather?.first?.id,
            main: dailyResult.weather?.first?.main,
            description: dailyResult.weather?.first?.description,
            icon: dailyResult.weather?.first?.icon
            )]
        self.clouds = dailyResult.clouds
        self.rain = dailyResult.rain
        self.uvi = dailyResult.uvi
    }
}

public struct TempViewModel {
    public var day: Double?
    public var min: Double?
    public var max: Double?
    public var night: Double?
    public var eve: Double?
    public var morn: Double?
}

public struct FeelsLikeViewModel {
    public var day: Double?
    public var night: Double?
    public var eve: Double?
    public var morn: Double?
}

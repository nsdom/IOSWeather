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

    public init(dailyResult: [WeatherCall.Daily]) {
        self.dt = dailyResult.first?.dt
        self.sunrise = dailyResult.first?.sunrise
        self.sunset = dailyResult.first?.sunset
        self.temp = TempViewModel(
            day: dailyResult.first?.temp?.day,
            min: dailyResult.first?.temp?.min,
            max: dailyResult.first?.temp?.max,
            night: dailyResult.first?.temp?.night,
            eve: dailyResult.first?.temp?.eve,
            morn: dailyResult.first?.temp?.morn
        )
        self.feelsLike = FeelsLikeViewModel(
            day: dailyResult.first?.feelsLike?.day,
            night: dailyResult.first?.feelsLike?.night,
            eve: dailyResult.first?.feelsLike?.eve,
            morn: dailyResult.first?.feelsLike?.morn
        )
        self.pressure = dailyResult.first?.pressure
        self.humidity = dailyResult.first?.humidity
        self.windSpeed = dailyResult.first?.windSpeed
        self.windDeg = dailyResult.first?.windDeg
        self.weather = [WeatherViewModel(
            id: dailyResult.first?.weather?.first?.id,
            main: dailyResult.first?.weather?.first?.main,
            description: dailyResult.first?.weather?.first?.description,
            icon: dailyResult.first?.weather?.first?.icon
            )]
        self.clouds = dailyResult.first?.clouds
        self.rain = dailyResult.first?.rain
        self.uvi = dailyResult.first?.uvi
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

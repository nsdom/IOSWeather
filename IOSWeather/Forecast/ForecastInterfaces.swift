//
//  ForecastInterfaces.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit
import CoreLocation

protocol ForecastNavigator {
    
}

protocol ForecastViewInterface {
    func showAutoCompleteResults(_ results: [AutoCompleteViewModel])
    
    func showLookUpResults(_ results: LookUpViewModel)
    
    func showCurrentWeather(_ results: CurrentWeatherViewModel)
    func showHourlyWeather(_ results: [HourlyWeatherViewModel])
    func showDailyWeather(_ results: [DailyWeatherViewModel])
    
}

protocol ForecastViewModelInterface {
    func getAutoComplete(query: String)
    
    func getLookUp(locationId: String)
    
    func getWeather(location: CLLocationCoordinate2D)
}

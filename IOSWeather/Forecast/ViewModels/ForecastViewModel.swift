//
//  ForecastViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewModel {
    
    // MARK: - Properties
    
    private let view: ForecastViewInterface
    private let navigator: ForecastNavigator
    let autoCompleteData = AutoCompleteData()
    let lookUpData = LookUpData()
    let weatherData = WeatherCallData()
    
    // MARK: - Initialization
    
    init(view: ForecastViewInterface, navigator: ForecastNavigator) {
        self.view = view
        self.navigator = navigator
    }
    
}

extension ForecastViewModel: ForecastViewModelInterface {
    func getWeather(location: CLLocationCoordinate2D) {
        weatherData.fetchWeather(location: location) { (result) in
            switch result {
            case .success(let weatherResult):
                guard let currentResult = weatherResult.current else { return }
                let currentWeather = CurrentWeatherViewModel(currentResult: currentResult)
                
                guard let hourlyResult = weatherResult.hourly else { return }
                let hourlyWeather = hourlyResult.map { (hourlyData)  in
                    return HourlyWeatherViewModel(hourlyResult: [hourlyData])
                }
                
                guard let dailyResult = weatherResult.daily else { return }
                let dailyWeather = DailyWeatherViewModel(dailyResult: dailyResult)

                DispatchQueue.main.async {
                    self.view.showCurrentWeather(currentWeather)
                    self.view.showHourlyWeather(hourlyWeather)
                    self.view.showDailyWeather(dailyWeather)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getLookUp(locationId: String) {
        lookUpData.fetchSearchLocation(locationId) { (result) in
            switch result {
            case .success(let coordResults):
                let lookUpResult = LookUpViewModel(coordinateResult: coordResults)
                DispatchQueue.main.async {
                    self.view.showLookUpResults(lookUpResult)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getAutoComplete(query: String) {
            autoCompleteData.fetchAutoComplete(searchQuery: query) { (result) in
                switch result {
                case .success(let searchResult):
                    let locationSearchResult = searchResult.map { (autoComplete) in
                        return AutoCompleteViewModel(locationSearch: autoComplete)
                    }
                    DispatchQueue.main.async {
                         self.view.showAutoCompleteResults(locationSearchResult)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
}

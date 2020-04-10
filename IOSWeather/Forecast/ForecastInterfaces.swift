//
//  ForecastInterfaces.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

protocol ForecastNavigator {
    
}

protocol ForecastViewInterface {
    func showResults(_ results: [AutoCompleteViewModel])
}

protocol ForecastViewModelInterface {
    func getAutoComplete(query: String)
}

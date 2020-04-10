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
    func showAutoCompleteResults(_ results: [AutoCompleteViewModel])
    
    func showLookUpResults(_ results: LookUpViewModel)
}

protocol ForecastViewModelInterface {
    func getAutoComplete(query: String)
    
    func getLookUp(locationId: String)
}

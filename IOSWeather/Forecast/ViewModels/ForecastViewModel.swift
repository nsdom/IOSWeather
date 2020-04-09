//
//  ForecastViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class ForecastViewModel {
    
    // MARK: - Properties
    
    private let view: ForecastViewInterface
    private let navigator: ForecastNavigator
    
    // MARK: - Initialization
    
    init(view: ForecastViewInterface, navigator: ForecastNavigator) {
        self.view = view
        self.navigator = navigator
    }
    
}

extension ForecastViewModel: ForecastViewModelInterface {
    
}

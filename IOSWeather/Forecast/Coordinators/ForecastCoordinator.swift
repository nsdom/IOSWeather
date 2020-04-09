//
//  ForecastCoordinator.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

class ForecastCoordinator {
    
    func start() {
        
        let vc = ForecastViewController()
        let viewModel = ForecastViewModel(view: vc, navigator: self)
        
        vc.viewModel = viewModel
    }
}

extension ForecastCoordinator: ForecastNavigator {
    
}

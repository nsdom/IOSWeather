//
//  MapCoordinator.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

class MapCoordinator {
    
    func start() {
        
        let vc = MapViewController()
        let viewModel = MapViewModel(view: vc, navigator: self)
        
        vc.viewModel = viewModel
        
    }
    
}

extension MapCoordinator: MapNavigator {
    
}

//
//  MapViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class MapViewModel {
    
    // MARK: - Properties
    
    private let view: MapViewInterface
    private let navigator: MapNavigator
    
    // MARK: - Initialization
    
    init(view: MapViewInterface, navigator: MapNavigator) {
        self.view = view
        self.navigator = navigator
    }
}

extension MapViewModel: MapViewModelInterface {
    
}

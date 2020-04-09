//
//  SettingsCoordinator.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

class SettingsCoordinator {
    
    func start() {
        
        let vc = SettingsViewController()
        let viewModel = SettingsViewModel(view: vc, navigator: self)
        
        vc.viewModel = viewModel
    }
}

extension SettingsCoordinator: SettingsNavigator {
    
}

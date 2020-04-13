//
//  SettingsViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class SettingsViewModel {
    
    // MARK: - Properties
    
    private let view: SettingsViewInterface
    private let navigator: SettingsNavigator
    
    // MARK: - Initialization
    
    init(view: SettingsViewInterface, navigator: SettingsNavigator) {
        self.view = view
        self.navigator = navigator
    }
    
}

extension SettingsViewModel: SettingsViewModelInterface {
    func getSettingsOptions() {
        var SettingsOptionsSections: [SettingsOptionsViewModel] = []
        
    }
}

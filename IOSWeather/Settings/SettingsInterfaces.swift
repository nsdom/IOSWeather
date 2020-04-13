//
//  SettingsInterfaces.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

protocol SettingsNavigator {
    
}

protocol SettingsViewInterface {
    func showSettingsOptions(_ settingsOptions: [SettingsOptionsViewModel])
}

protocol SettingsViewModelInterface {
    func getSettingsOptions()
}

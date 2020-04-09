//
//  TabBarViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class TabBarViewModel {
    
    // MARK: - Properties
    
    private let view: MainViewInterface
    private let navigator: MainNavigator
    
    // MARK: - Initialization
    
    init(view: MainViewInterface, navigator: MainNavigator) {
        self.view = view
        self.navigator = navigator
        
    }
}

extension TabBarViewModel: MainViewModelInterface {
    
}

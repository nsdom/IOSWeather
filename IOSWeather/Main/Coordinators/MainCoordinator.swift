//
//  MainCoordinator.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

class MainCoordinator {
    
    func start() {
        
        let vc = TabBarViewController()
        let viewModel = TabBarViewModel(view: vc, navigator: self)
        
        vc.viewModel = viewModel
        
    }
    
}

extension MainCoordinator: MainNavigator {
    
}

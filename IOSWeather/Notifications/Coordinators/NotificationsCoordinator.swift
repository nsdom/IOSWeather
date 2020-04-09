//
//  NotificationsCoordinator.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

class NotificationsCoordinator {
    
    func start() {
        
        let vc = NotificationsViewController()
        let viewModel = NotificationsViewModel(view: vc, navigator: self)
        
        vc.viewModel = viewModel
    }
}

extension NotificationsCoordinator: NotificationsNavigator {
    
}

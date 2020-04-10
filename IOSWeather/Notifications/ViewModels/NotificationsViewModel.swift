//
//  NotificationsViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class NotificationsViewModel {
    
    // MARK: - Properties
    private let view: NotificationsViewInterface
    private let navigator: NotificationsNavigator
    
    // MARK: - Initialization
    init(view: NotificationsViewInterface, navigator: NotificationsNavigator) {
        self.view = view
        self.navigator = navigator
    }
}

extension NotificationsViewModel: NotificationsViewModelInteface {
}

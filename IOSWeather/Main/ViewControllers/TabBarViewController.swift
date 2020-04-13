//
//  TabBarController.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    // MARK: - Properties
    
    var viewModel: MainViewModelInterface!
    let mapViewController = MapViewController()
    let settingsViewController = SettingsViewController()
    let forecastViewController = ForecastViewController()
    let notificationsViewController = NotificationsViewController()
    
    // MARK: - ViewCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarApearance()
        setupTabBarItems()
        forecastViewController.viewModel = ForecastViewModel(
            view: forecastViewController,
            navigator: ForecastCoordinator()
        )
        viewControllers = [
            forecastViewController,
            mapViewController,
            notificationsViewController,
            settingsViewController
        ]
    }
    
    fileprivate func setupTabBarApearance() {
        tabBar.tintColor = UIColor(named: "blue")
        tabBar.unselectedItemTintColor = UIColor(named: "black")
        tabBar.barStyle = .default
        tabBar.isTranslucent = false
    }
    
    fileprivate func setupTabBarItems() {
        let imageForecast = UIImage(systemName: "cloud.sun.bolt")
        forecastViewController.tabBarItem.image = imageForecast
        forecastViewController.tabBarItem.title = "Forecast"
        
        let imageMap = UIImage(systemName: "map")
        mapViewController.tabBarItem.image = imageMap
        mapViewController.tabBarItem.title = "Map"
        
        let imageNotifications = UIImage(systemName: "bell")
        notificationsViewController.tabBarItem.image = imageNotifications
        notificationsViewController.tabBarItem.title = "Notifications"
        
        let imageSettings = UIImage(systemName: "gear")
        settingsViewController.tabBarItem.image = imageSettings
        settingsViewController.tabBarItem.title = "Settings"
    }
}

extension TabBarViewController: MainViewInterface {
}

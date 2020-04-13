//
//  NotificationsViewController.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController {
    
    // MARK: - Properties
    var viewModel: NotificationsViewModelInteface!
    
    // MARK: - ViewCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "white")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
}

extension NotificationsViewController: NotificationsViewInterface {
    
}

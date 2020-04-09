//
//  SettingsViewController.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: SettingsViewModelInterface!
    
    let titleLabelView: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        lv.text = "Settings"
        lv.textAlignment = .center
        lv.font = .boldSystemFont(ofSize: 24)
        lv.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return lv
    }()
    
    // MARK: - ViewCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(titleLabelView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            titleLabelView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titleLabelView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabelView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleLabelView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
    }
    
}

extension SettingsViewController: SettingsViewInterface {
    
}

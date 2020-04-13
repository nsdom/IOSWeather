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
        lv.backgroundColor = UIColor(named: "white")
        lv.text = "Settings"
        lv.textAlignment = .center
        lv.font = .boldSystemFont(ofSize: 24)
        lv.textColor = UIColor(named: "black")
        return lv
    }()
    
    let settingsTableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    // MARK: - ViewCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "white")
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
    func showSettingsOptions(_ settingsOptions: [SettingsOptionsViewModel]) {
    }
    
}

//extension SettingsViewController: UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        4
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
    
//}

//
//  SettingsTableViewCell.swift
//  IOSWeather
//
//  Created by Nicola on 13/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    static var reuseID = String(describing: self)
    
    let settingsStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillProportionally
        return sv
    }()
    
    let settingsDescriptionLabel: UILabel = {
        let sl = UILabel()
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    let rightOptionLabel: UILabel = {
        let rl = UILabel()
        rl.translatesAutoresizingMaskIntoConstraints = false
        return rl
    }()
    
    let leftOptionLabel: UILabel = {
        let ll = UILabel()
        ll.translatesAutoresizingMaskIntoConstraints = false
        return ll
    }()
    
    let settingsSwitch: UISwitch = {
        let ss = UISwitch()
        ss.translatesAutoresizingMaskIntoConstraints = false
        return ss
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(settingsStackView)
        settingsStackView.addArrangedSubview(settingsDescriptionLabel)
        settingsStackView.addArrangedSubview(rightOptionLabel)
        settingsStackView.addArrangedSubview(settingsSwitch)
        settingsStackView.addArrangedSubview(leftOptionLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        NSLayoutConstraint.activate([
            settingsStackView.topAnchor.constraint(equalTo: self.topAnchor),
            settingsStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            settingsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            settingsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

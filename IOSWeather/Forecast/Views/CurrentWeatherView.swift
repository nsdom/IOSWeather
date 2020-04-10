//
//  CurrentWeatherView.swift
//  IOSWeather
//
//  Created by Nicola on 10/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class CurrentWeatherView: UIView {
    
    // MARK: - Properties
    
    var currentWeather: CurrentWeatherViewModel? {
        didSet {
            
        }
    }
    
    let hStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.spacing = 16
        return sv
    }()
    
    let vStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.spacing = 8
        return sv
    }()
    
    let iconImageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        return iv
    }()
    
    let tempLabelView: UILabel = {
       let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return lv
    }()
    
    let feelsLikeLabelView: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return lv
    }()
    
    let mapSnapImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 20
        iv.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        return iv
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(hStackView)
        hStackView.addArrangedSubview(vStackView)
        hStackView.addArrangedSubview(mapSnapImageView)
        vStackView.addArrangedSubview(iconImageView)
        vStackView.addArrangedSubview(tempLabelView)
        vStackView.addArrangedSubview(feelsLikeLabelView)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: self.topAnchor),
            hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: hStackView.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: hStackView.leadingAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 80),
            iconImageView.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            tempLabelView.topAnchor.constraint(equalTo: iconImageView.bottomAnchor, constant: 10),
            tempLabelView.heightAnchor.constraint(equalToConstant: 80),
            tempLabelView.leadingAnchor.constraint(equalTo: hStackView.leadingAnchor),
            tempLabelView.trailingAnchor.constraint(equalTo: vStackView.trailingAnchor)
        ])
//
//        NSLayoutConstraint.activate([
//            feelsLikeLabelView.topAnchor.co
//        ])
        
        NSLayoutConstraint.activate([
            mapSnapImageView.trailingAnchor.constraint(equalTo: hStackView.trailingAnchor),
            mapSnapImageView.bottomAnchor.constraint(equalTo: hStackView.bottomAnchor),
            mapSnapImageView.widthAnchor.constraint(equalToConstant: 175),
            mapSnapImageView.heightAnchor.constraint(equalToConstant: 175)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

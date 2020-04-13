//
//  WeatherDataCollectionViewCell.swift
//  IOSWeather
//
//  Created by Nicola on 11/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    static var reuseId = String(describing: self)
    
    var hourlyWeatherResults: HourlyWeatherViewModel? {
        didSet {
            guard let temp = hourlyWeatherResults?.temp else { return }
            self.tempLabel.text = "\(Int(temp))ºC"
            
            guard let description = hourlyWeatherResults?.weather?.first?.description else { return }
            self.descriptionLabel.text = description
            
            guard let unixTime = hourlyWeatherResults?.dt else { return }
            let time = Date(timeIntervalSince1970: Double(unixTime)).shortTime
            self.timeLabel.text = time
        }
    }
    
    var dailyWeatherResults: DailyWeatherViewModel? {
        didSet {
            guard let maxTemp = dailyWeatherResults?.temp?.max else { return }
            self.descriptionLabel.text = "max: \(Int(maxTemp))ºC"
            
            guard let minTemp = dailyWeatherResults?.temp?.min else { return }
            self.tempLabel.text = "min: \(Int(minTemp))ºC"
            
            guard let unixTime = dailyWeatherResults?.dt else { return }
            let time = Date(timeIntervalSince1970: Double(unixTime)).shortDate
            self.timeLabel.text = time
        }
        
    }
    
    let hstackView: UIStackView = {
        let hs = UIStackView()
        hs.translatesAutoresizingMaskIntoConstraints = false
        hs.axis = .horizontal
        return hs
    }()
    
    let timeLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.backgroundColor = UIColor(named: "white")
        tl.font = .boldSystemFont(ofSize: 18)
        return tl
    }()
    
    let descriptionLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.backgroundColor = UIColor(named: "white")
        dl.textAlignment = .center
        dl.font = .boldSystemFont(ofSize: 18)
        return dl
    }()
    
    let tempLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.backgroundColor = UIColor(named: "white")
        tl.textAlignment = .right
        tl.font = .boldSystemFont(ofSize: 18)
        return tl
    }()
    
    let separatorView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(named: "black")
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hstackView)
        hstackView.addArrangedSubview(timeLabel)
        hstackView.addArrangedSubview(descriptionLabel)
        hstackView.addArrangedSubview(tempLabel)
        addSubview(separatorView)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            hstackView.topAnchor.constraint(equalTo: self.topAnchor),
            hstackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            hstackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            hstackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: hstackView.bottomAnchor),
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            separatorView.heightAnchor.constraint(equalToConstant: 1.25)
        ])
        
        timeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

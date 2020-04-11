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
            self.tempLabel.text = "\(temp)ºC"
            
            guard let description = hourlyWeatherResults?.weather?.first?.description else { return }
            self.descriptionLabel.text = description
            
            guard let unixTime = hourlyWeatherResults?.dt else { return }
            let time = NSDate(timeIntervalSince1970: Double(unixTime))
            self.timeLabel.text = "\(time)"
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
        tl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tl
    }()
    
    let descriptionLabel: UILabel = {
        let dl = UILabel()
        dl.translatesAutoresizingMaskIntoConstraints = false
        dl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return dl
    }()
    
    let tempLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        return tl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        addSubview(hstackView)
        hstackView.addArrangedSubview(timeLabel)
        hstackView.addArrangedSubview(descriptionLabel)
        hstackView.addArrangedSubview(tempLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            hstackView.topAnchor.constraint(equalTo: self.topAnchor),
            hstackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hstackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hstackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        timeLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
        tempLabel.widthAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

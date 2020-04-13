//
//  WeatherCollectionViewHeader.swift
//  IOSWeather
//
//  Created by Nicola on 12/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class WeatherCollectionViewHeader: UICollectionReusableView {
    
    static var reuseID = String(describing: self)
    
    var hourlyWeatherResult: [HourlyWeatherViewModel]? {
        didSet {

        }
    }
    
    let vStackView: UIStackView = {
        let vs = UIStackView()
        vs.translatesAutoresizingMaskIntoConstraints = false
        return vs
    }()
    
    let hStackView: UIStackView = {
        let hs = UIStackView()
        hs.translatesAutoresizingMaskIntoConstraints = false
        return hs
    }()
    
    let titleLabel: UIView = {
        let sl = UILabel()
        sl.translatesAutoresizingMaskIntoConstraints = false
        sl.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        sl.text = "Hourly Weather"
        sl.textAlignment = .center
        return sl
    }()
    
    let maxTemLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        return tl
    }()
    
    let minTempLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return tl
    }()
    
    let separatorView: UIView = {
        let sv = UIView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(vStackView)
        vStackView.addSubview(titleLabel)
        vStackView.addSubview(hStackView)
        hStackView.addSubview(maxTemLabel)
        hStackView.addSubview(minTempLabel)
        addSubview(separatorView)
        guard let results = hourlyWeatherResult else { return }
        self.getMaxTemp(results: results)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            vStackView.topAnchor.constraint(equalTo: self.topAnchor),
            vStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            vStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            vStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: vStackView.bottomAnchor, constant: 5),
            separatorView.heightAnchor.constraint(equalToConstant: 1.25)
        ])
        
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: self.bounds.width).isActive = true
        hStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        maxTemLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        minTempLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
    }
    
    func getMaxTemp(results: [HourlyWeatherViewModel]) {
        
        var temperature: [Int] = [-50]
        var maxTemp = -50
        for n in (1...25) {
            guard let temp = results[n - 1].temp else { return }
            temperature.append(Int(temp))
            if temperature[n] > temperature[n - 1] {
                maxTemp = temperature[n]
            }
        }
        self.maxTemLabel.text = "\(maxTemp)ºC"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

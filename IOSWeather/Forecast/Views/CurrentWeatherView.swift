//
//  CurrentWeatherView.swift
//  IOSWeather
//
//  Created by Nicola on 10/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit
import Kingfisher

class CurrentWeatherView: UIView {
    
    // MARK: - Properties
    
    var currentWeather: CurrentWeatherViewModel? {
        didSet {
            guard let iconString = currentWeather?.weather?.first?.icon else { return }
            let iconUrl = "http://openweathermap.org/img/wn/\(iconString)@2x.png"
            self.iconImageView.kf.setImage(with: URL(string: iconUrl))
            
            guard let temp = currentWeather?.temp else { return }
            self.tempLabelView.text = "\(Int(temp))ºC"
            guard let description = currentWeather?.weather?.first?.description else { return }
            self.descriptionLabelView.text = description
            
            guard let feelsLike = currentWeather?.feelsLike else { return }
            self.feelsLikeLabelView.text = "Feels like \(Int(feelsLike))ºC"
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
        sv.spacing = 5
        return sv
    }()
    
    let iconImageView: UIImageView = {
       let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let tempLabelView: UILabel = {
       let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.font = .boldSystemFont(ofSize: 50)
        lv.textColor = UIColor(named: "black")
        lv.textAlignment = .center
        return lv
    }()
    
    let descriptionLabelView: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.font = .systemFont(ofSize: 18)
        lv.textColor = UIColor(named: "black")
        lv.textAlignment = .center
        return lv
    }()
    
    let feelsLikeLabelView: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.font = .systemFont(ofSize: 18)
        lv.textColor = UIColor(named: "black")
        lv.textAlignment = .center
        return lv
    }()
    
    let mapSnapImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "mapSnap")
        iv.image?.withRenderingMode(.alwaysTemplate)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 20
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
        vStackView.addArrangedSubview(descriptionLabelView)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
        iconImageView.heightAnchor.constraint(equalToConstant: 75).isActive = true
        tempLabelView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        feelsLikeLabelView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        descriptionLabelView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        mapSnapImageView.widthAnchor.constraint(equalToConstant: 175).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

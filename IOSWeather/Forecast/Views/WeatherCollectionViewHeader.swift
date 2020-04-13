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
    
    let hStackView: UIStackView = {
        let hs = UIStackView()
        hs.translatesAutoresizingMaskIntoConstraints = false
        hs.axis = .horizontal
        hs.distribution = .fillEqually
        return hs
    }()
        
    let maxTempLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.font = .boldSystemFont(ofSize: 18)
        tl.textAlignment = .center
        return tl
    }()
    
    let minTempLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.font = .boldSystemFont(ofSize: 18)
        tl.textAlignment = .center
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
        addSubview(hStackView)
        hStackView.addArrangedSubview(maxTempLabel)
        hStackView.addArrangedSubview(minTempLabel)
        addSubview(separatorView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            hStackView.topAnchor.constraint(equalTo: self.topAnchor),
            hStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            separatorView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            separatorView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            separatorView.topAnchor.constraint(equalTo: hStackView.bottomAnchor, constant: 5),
            separatorView.heightAnchor.constraint(equalToConstant: 1.25)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

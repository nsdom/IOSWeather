//
//  ColectionViewCell.swift
//  IOSWeather
//
//  Created by Nicola on 11/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    static var reuseID = String(describing: self)
    
    var hourlyResults: [HourlyWeatherViewModel]? {
     didSet {
        let indexPath = IndexPath(item: 0, section: 0)
        guard let header = collectionView.supplementaryView(
            forElementKind: UICollectionView.elementKindSectionHeader,
            at: indexPath) as? WeatherCollectionViewHeader else { return }
        let max = hourlyResults?.sorted { $0.temp ?? 0 > $1.temp ?? 0 }.first?.temp ?? 0
        let min = hourlyResults?.sorted { $0.temp ?? 0 < $1.temp ?? 0}.first?.temp ?? 0
        header.maxTempLabel.text = "Highest: \(Int(max))ºC"
        header.minTempLabel.text = "Lowest: \(Int(min))ºC"
        collectionView.reloadData()
        }
    }
     
    var dailyResults: [DailyWeatherViewModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var isHourly: Bool = true
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return cv
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            WeatherCollectionViewCell.self,
            forCellWithReuseIdentifier: WeatherCollectionViewCell.reuseId)
        collectionView.register(
            WeatherCollectionViewHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: WeatherCollectionViewHeader.reuseID
        )

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isHourly ? hourlyResults?.count ?? 0 : dailyResults?.count ?? 0
    }

    //swiftlint:disable force_cast
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WeatherCollectionViewCell.reuseId,
            for: indexPath) as! WeatherCollectionViewCell
        
        if isHourly {
             cell.hourlyWeatherResults = hourlyResults?[indexPath.row]
        } else {
            cell.dailyWeatherResults = dailyResults?[indexPath.row]
        }
       
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeader = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: WeatherCollectionViewHeader.reuseID,
            for: indexPath) as! WeatherCollectionViewHeader
        return sectionHeader
    }
    //swiftlint:enable force_cast

}

extension CollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 60)
    }
    
}

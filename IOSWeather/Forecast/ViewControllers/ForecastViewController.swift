//
//  ForecastViewController.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit
import CoreLocation

class ForecastViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ForecastViewModelInterface!
    var currentWeatherView = CurrentWeatherView()
    var autoCompleteResults: [AutoCompleteViewModel]? {
        didSet {
            searchResultsTableView.reloadData()
            self.titleLabelView.text = autoCompleteResults?.first?.address.city
        }
    }
    
    var lookUpResult: LookUpViewModel? {
        didSet {
            searchResultsTableView.reloadData()
        }
    }
    
    var currentWeatherResult: CurrentWeatherViewModel? {
        didSet {
            currentWeatherView.currentWeather = currentWeatherResult
        }
    }
    
    var hourlyWeatherResult: [HourlyWeatherViewModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var dailyWeatherResult: [DailyWeatherViewModel]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var leadingConstraint: NSLayoutConstraint?
    
    var selectedIndex: Int = 0 {
        didSet {
            if selectedIndex == 0 {
                dailyWeatherButton.isEnabled = true
                hourlyWeatherButton.isEnabled = false
            } else {
                dailyWeatherButton.isEnabled = false
                hourlyWeatherButton.isEnabled = true
            }
            
            var constant: CGFloat = 0.0
            if selectedIndex == 0 {
                constant = 0.0
            } else {
                constant = view.bounds.width / 2
            }
            
            leadingConstraint?.constant = constant
            view.setNeedsLayout()
            UIView.animate(withDuration: 0.3, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    let titleLabelView: UILabel = {
        let lv = UILabel()
        lv.translatesAutoresizingMaskIntoConstraints = false
        lv.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        lv.font = .boldSystemFont(ofSize: 32)
        lv.textAlignment = .center
        return lv
    }()
    
    let separatorView: UIView = {
        let sv = UIView()
        sv.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let searchBarView: UISearchBar = {
       let sb = UISearchBar()
        sb.translatesAutoresizingMaskIntoConstraints = false
        sb.backgroundColor = .clear
        sb.placeholder = "Search Location"
        sb.searchTextField.textAlignment = .left
        sb.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sb.searchTextField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        sb.searchTextField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        sb.isTranslucent = false
        sb.backgroundImage = UIImage()
        return sb
    }()
    
    let searchResultsTableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.isHidden = true
        tb.tableFooterView = UIView()
        return tb
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cv.isPagingEnabled = true
        cv.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return cv
    }()
    
    let weatherTypeContainer: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.isHidden = true
        return iv
    }()
    
    let weatherDisplayStackView: UIStackView = {
        let hs = UIStackView()
        hs.distribution = .fillEqually
        hs.translatesAutoresizingMaskIntoConstraints = false
        hs.axis = .horizontal
        return hs
    }()
    
    let weatherDisplayScrollBar: UIView = {
       let bv = UIView()
        bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return bv
    }()
    
    let hourlyWeatherButton: UIButton = {
        let hb = UIButton(type: .system)
        hb.translatesAutoresizingMaskIntoConstraints = false
        let title = "Hourly"
        let attributes: [NSAttributedString.Key: Any]? = [
            .font: UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        hb.setAttributedTitle(attributedString, for: .normal)
        hb.addTarget(self, action: #selector(switchWeatherDisplay(_:)), for: .touchUpInside)
        hb.isEnabled = false
        return hb
    }()
    
    let dailyWeatherButton: UIButton = {
        let db = UIButton(type: .system)
        db.translatesAutoresizingMaskIntoConstraints = false
        let title = "Daily"
        let attributes: [NSAttributedString.Key: Any]? = [
            .font: UIFont.boldSystemFont(ofSize: 18),
            .foregroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        ]
        let attributedString = NSAttributedString(string: title, attributes: attributes)
        db.setAttributedTitle(attributedString, for: .normal)
        db.addTarget(self, action: #selector(switchWeatherDisplay(_:)), for: .touchUpInside)
        return db
    }()
    
    var hourlyResults: [HourlyWeatherViewModel] = []
     
    var dailyResults: [DailyWeatherViewModel] = []
    
    // MARK: - ViewCycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        searchResultsTableView.register(
            SearchResultTableViewCell.self,
            forCellReuseIdentifier: SearchResultTableViewCell.reuseID
        )
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        addSubviews()
        setupButtonsLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSearchLayout()
        setupForecastLayouts()
    }
    
    fileprivate func addSubviews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(separatorView)
        view.addSubview(searchBarView)
        view.addSubview(collectionView)
        view.addSubview(searchResultsTableView)
        view.addSubview(currentWeatherView)
        view.addSubview(weatherTypeContainer)
        weatherTypeContainer.addSubview(weatherDisplayStackView)
        weatherTypeContainer.addSubview(weatherDisplayScrollBar)
        weatherDisplayStackView.addArrangedSubview(hourlyWeatherButton)
        weatherDisplayStackView.addArrangedSubview(dailyWeatherButton)
        searchBarView.delegate = self

    }
    
    // MARK: - Layout Functions
    
    fileprivate func setupSearchLayout() {
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            separatorView.heightAnchor.constraint(equalToConstant: 1.5)
        ])
        
        NSLayoutConstraint.activate([
            searchBarView.bottomAnchor.constraint(equalTo: separatorView.topAnchor, constant: -4),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            searchBarView.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            searchResultsTableView.leadingAnchor.constraint(equalTo: separatorView.leadingAnchor),
            searchResultsTableView.trailingAnchor.constraint(equalTo: separatorView.trailingAnchor),
            searchResultsTableView.topAnchor.constraint(equalTo: separatorView.bottomAnchor),
            searchResultsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    fileprivate func setupForecastLayouts() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: separatorView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: separatorView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currentWeatherView.bottomAnchor.constraint(equalTo: searchBarView.topAnchor, constant: -20),
            currentWeatherView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            currentWeatherView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    fileprivate func setupButtonsLayout() {
        NSLayoutConstraint.activate([
            weatherTypeContainer.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: 0),
            weatherTypeContainer.leadingAnchor.constraint(equalTo: separatorView.leadingAnchor),
            weatherTypeContainer.trailingAnchor.constraint(equalTo: separatorView.trailingAnchor),
            weatherTypeContainer.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            weatherDisplayStackView.topAnchor.constraint(equalTo: weatherTypeContainer.topAnchor),
            weatherDisplayStackView.leadingAnchor.constraint(equalTo: weatherTypeContainer.leadingAnchor),
            weatherDisplayStackView.trailingAnchor.constraint(equalTo: weatherTypeContainer.trailingAnchor),
            weatherDisplayStackView.bottomAnchor.constraint(equalTo: weatherTypeContainer.bottomAnchor, constant: -5)
        ])
        NSLayoutConstraint.activate([
            weatherDisplayScrollBar.topAnchor.constraint(equalTo: weatherDisplayStackView.bottomAnchor),
            weatherDisplayScrollBar.widthAnchor.constraint(equalToConstant: view.bounds.width / 2 - 16),
            weatherDisplayScrollBar.heightAnchor.constraint(equalToConstant: 4)
        ])

        leadingConstraint = weatherDisplayScrollBar.leadingAnchor.constraint(
            equalTo: weatherTypeContainer.leadingAnchor, constant: 0)
        leadingConstraint?.isActive = true
    }
    
    // MARK: - Other Functions
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / collectionView.bounds.width)
        selectedIndex = index
    }
    
    @objc func switchWeatherDisplay(_ sender: UIButton) {

        selectedIndex = (selectedIndex == 0) ? 1 : 0
        let index = IndexPath(item: selectedIndex, section: 0)
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - Extensions

extension ForecastViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchResultsTableView.isHidden = false
        weatherTypeContainer.isHidden = true
        searchBar.text = nil
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let query = searchText.replacingOccurrences(of: " ", with: "%20")
        viewModel.getAutoComplete(query: query)
    }
    
}

extension ForecastViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = autoCompleteResults?.count  else { return 1}
        return count != 0 ? count : 0
    }
    
    //swiftlint:disable force_cast
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultsTableView.dequeueReusableCell(
            withIdentifier: SearchResultTableViewCell.reuseID,
            for: indexPath) as! SearchResultTableViewCell
        cell.autoCompleteSearch = self.autoCompleteResults?[indexPath.row]
        
        return cell
    }
    //swiftlint:enable force_cast

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let locationId = autoCompleteResults?[indexPath.row].locationId else { return }
        viewModel.getLookUp(locationId: locationId)
        searchResultsTableView.isHidden = true
        weatherTypeContainer.isHidden = false
        searchBarView.resignFirstResponder()
        searchResultsTableView.deselectRow(at: indexPath, animated: true)
        autoCompleteResults = nil
    }
    
}

extension ForecastViewController: UITableViewDelegate {
    
}

extension ForecastViewController: ForecastViewInterface {
    func showCurrentWeather(_ results: CurrentWeatherViewModel) {
        self.currentWeatherResult = results
    }
    
    func showHourlyWeather(_ results: [HourlyWeatherViewModel]) {
        self.hourlyResults = results
        collectionView.reloadData()
//        let indexPath = IndexPath(item: 0, section: 0)
//        guard let cell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell else { return }
//        cell.hourlyResults = results
//        cell.isHourly = true
    }
    
    func showDailyWeather(_ results: [DailyWeatherViewModel]) {
        self.dailyResults = results
        collectionView.reloadData()
//        let indexPath = IndexPath(item: 1, section: 0)
//        guard let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath) as?
//        CollectionViewCell else { return }
//         collectionView.cellForItem(at: indexPath)
////        cell.dailyResults = results
//        cell.isHourly = false
    }
    
    func showLookUpResults(_ results: LookUpViewModel) {
        self.lookUpResult = results
        var locationCoord = CLLocationCoordinate2D(latitude: 0, longitude: 0)
        guard let lat = results.displayLocation?.lat else { return }
        guard let lon = results.displayLocation?.lon else { return }
        locationCoord.latitude = lat
        locationCoord.longitude = lon
        
        viewModel.getWeather(location: locationCoord)
        
    }
    
    func showAutoCompleteResults(_ results: [AutoCompleteViewModel]) {
        self.autoCompleteResults = results
    }
    
}

extension ForecastViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    //swiftlint:disable force_cast

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.reuseID,
            for: indexPath) as! CollectionViewCell
        
        if indexPath.item == 0 {
             cell.isHourly = true
            cell.hourlyResults = hourlyResults
        } else {
            cell.isHourly = false
            cell.dailyResults = dailyResults
        }
        
        return cell
    }
    //swiftlint:enable force_cast
    
}

extension ForecastViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: separatorView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
}

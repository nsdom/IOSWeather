//
//  ForecastViewController.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class ForecastViewController: UIViewController {
    
    // MARK: - Properties
    
    var viewModel: ForecastViewModelInterface!
    
    var autoCompleteResults: [AutoCompleteViewModel]? {
        didSet {
            searchResultsTableView.reloadData()
        }
    }
    
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
//        sb.placeholder = "Search Location"
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
        return tb
    }()
    
    // MARK: - ViewCycle
        
    override func viewDidLoad() {
        super.viewDidLoad()
        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
        searchResultsTableView.register(
            SearchResultTableViewCell.self,
            forCellReuseIdentifier: SearchResultTableViewCell.reuseID
        )
        addSubviews()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        NSLayoutConstraint.activate([
            separatorView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
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
            searchResultsTableView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    fileprivate func addSubviews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(separatorView)
        view.addSubview(searchBarView)
        view.addSubview(searchResultsTableView)
        searchBarView.delegate = self
    }
}

// MARK: - Extensions

extension ForecastViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchResultsTableView.isHidden = false
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
        searchBarView.resignFirstResponder()
        searchBarView.text = nil
        searchResultsTableView.deselectRow(at: indexPath, animated: true)
        autoCompleteResults = nil
    }
    
}

extension ForecastViewController: UITableViewDelegate {
    
}

extension ForecastViewController: ForecastViewInterface {
    func showLookUpResults(_ results: LookUpViewModel) {
        
    }
    
    func showAutoCompleteResults(_ results: [AutoCompleteViewModel]) {
        self.autoCompleteResults = results
    }
    
}

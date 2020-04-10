//
//  ForecastViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class ForecastViewModel {
    
    // MARK: - Properties
    
    private let view: ForecastViewInterface
    private let navigator: ForecastNavigator
    let autoCompleteData = AutoCompleteData()
    
    // MARK: - Initialization
    
    init(view: ForecastViewInterface, navigator: ForecastNavigator) {
        self.view = view
        self.navigator = navigator
    }
    
}

extension ForecastViewModel: ForecastViewModelInterface {
    
    func getAutoComplete(query: String) {
            autoCompleteData.fetchAutoComplete(searchQuery: query) { (result) in
                switch result {
                case .success(let searchResult):
                    let locationSearchResult = searchResult.map { (autoComplete) in
                        return AutoCompleteViewModel(locationSearch: autoComplete)
                    }
                    DispatchQueue.main.async {
                         self.view.showResults(locationSearchResult)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
}

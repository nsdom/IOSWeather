//
//  SearchResultTableViewCell.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    static var reuseID = String(describing: self)
    var autoCompleteSearch: AutoCompleteViewModel? {
        didSet {
            self.textLabel?.text = autoCompleteSearch?.label
        }
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

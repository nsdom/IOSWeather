//
//  AutoCompleteViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct AutoCompleteViewModel {
    
        public var label: String
        public var language: String
        public var locationId: String
        public var address: Address
        
        public struct Address {
            
            public var country: String?
            public var county: String?
            public var city: String?
            public var district: String?
            public var street: String?
            public var postalCode: String?
            
        }
    
    init(locationSearch: AutoComplete.Suggestions) {
        self.label = locationSearch.label
        self.language = locationSearch.language
        self.locationId = locationSearch.locationId
        self.address = Address(
            country: locationSearch.address.country,
            county: locationSearch.address.county,
            city: locationSearch.address.city,
            district: locationSearch.address.district,
            street: locationSearch.address.street,
            postalCode: locationSearch.address.postalCode
        )
        
    }
}

//
//  AutoComplete.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct AutoComplete: Codable {
    
    public var suggestions: [Suggestions]?

    public struct Suggestions: Codable {
        
        public var label: String
        public var language: String
        public var countryCode: String
        public var locationId: String
        public var address: Address
        public var matchLevel: String
    }
}

public struct Address: Codable {
    
    public var country: String?
    public var county: String?
    public var city: String?
    public var district: String?
    public var street: String?
    public var postalCode: String?
}

//
//  LookUp.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct LookUp: Codable {
    
    public var response: Response?
}

public struct Response: Codable {
    public var view: [LookUpViewResponse]?
}

public struct LookUpViewResponse: Codable {
    public var result: [LookUpResult]?
}

public struct LookUpResult: Codable {
    public var location: LookUpLocation?
}

public struct LookUpLocation: Codable {
    public var displayPosition: LookUpPosition?
    
}

public struct LookUpPosition: Codable {
    
    public var latitude: Double?
    public var longitude: Double?
}

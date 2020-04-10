//
//  LookUpViewModel.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public struct LookUpViewModel {
    public var displayLocation: PositionSetter?
    
    public struct PositionSetter {
        public var lat: Double?
        public var lon: Double?
        
    }
    
    public init(coordinateResult: LookUpPosition) {
        self.displayLocation = PositionSetter(
            lat: coordinateResult.latitude,
            lon: coordinateResult.longitude
        )
    }
}

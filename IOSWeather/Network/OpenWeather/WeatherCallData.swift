//
//  WeatherCallData.swift
//  IOSWeather
//
//  Created by Nicola on 10/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation
import CoreLocation

class WeatherCallData {
    
    public init() {}
    
    public func fetchWeather(location: CLLocationCoordinate2D, completion: @escaping (Result<WeatherCall, Error>) -> Void) {
        
       let baseUrl = "https://api.openweathermap.org/data/2.5/onecall?"
        let lat = "lat=\(location.latitude)"
        let lon = "&lon=\(location.longitude)"
        let appId = "&appid=787fe238b65daec25f3174ad4e60fa38"
        let urlString = "\(baseUrl)\(lat)\(lon)\(appId)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(WeatherCall.self, from: data)
                print(results)
                completion(.success(results))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

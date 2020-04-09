//
//  LookUpData.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation

public class LookUpData {
    public init() {}
    
    public func fetchSearchLocation(_ locationId: String, completion: @escaping  (Result<LookUpPosition, Error>) -> Void) {
        let atLocation = "locationid=\(locationId)"
        let baseUrl = "https://geocoder.api.here.com/6.2/geocode.json?\(atLocation)&jsonattributes=1&gen=9"
        let appID = "&app_id=b8FZxcGowAcWupBDY4sk"
        let appCode = "&app_code=eo_CV554JfdEvjMEdIOJ6A"
        let urlString = "\(baseUrl)\(appID)\(appCode)"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else { return }
            do {
              let decoder = JSONDecoder()
                let results = try decoder.decode(LookUp.self, from: data)
                guard let result =
                    results.response?.view?.first?.result?.first?.location?.displayPosition
                    else { return }
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

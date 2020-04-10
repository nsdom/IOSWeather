//
//  AutoCompleteData.swift
//  IOSWeather
//
//  Created by Nicola on 09/04/2020.
//  Copyright © 2020 Nicola. All rights reserved.
//

import Foundation
import CoreLocation

public class AutoCompleteData {
    
    public init() {}
    
    public func fetchAutoComplete(searchQuery: String, completion: @escaping (Result<[AutoComplete.Suggestions], Error>) -> Void) {
        
        let baseURL = "https://autocomplete.geocoder.api.here.com/6.2/suggest.json?"
               let appID = "&app_id=b8FZxcGowAcWupBDY4sk"
               let appCode = "&app_code=eo_CV554JfdEvjMEdIOJ6A"
               let query = "&query=\(searchQuery)"
               let urlString = "\(baseURL)\(query)\(appID)\(appCode)"
               guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(AutoComplete.self, from: data)
                guard let result = results.suggestions else { return }
                print(result)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}

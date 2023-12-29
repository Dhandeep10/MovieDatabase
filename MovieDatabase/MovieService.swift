//
//  MovieService.swift
//  MovieDatabase
//
//  Created by Dhandeep  Singh on 29/12/23.
//

import Foundation

class MovieService {
    static let apiKey = "2cdfeeec25db57e5f628e99329b34655"
    static let baseURL = "https://api.themoviedb.org/3"
    
    static func fetchMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error fetching movies: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response or server error.")
                completion(nil)
                return
            }

            guard let data = data else {
                print("No data received.")
                completion(nil)
                return
            }

            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(MovieResults.self, from: data)
                completion(result.results)
            } catch let decodingError {
                print("Error decoding JSON: \(decodingError)")
                completion(nil)
            }
        }.resume()
    }
}

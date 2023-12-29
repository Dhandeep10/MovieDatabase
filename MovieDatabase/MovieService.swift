//
//  MovieService.swift
//  MovieDatabase
//
//  Created by Dhandeep  Singh on 29/12/23.
//

import Foundation

class MovieService {
    static let apiKey = "YOUR_API_KEY"
    static let baseURL = "https://api.themoviedb.org/3"
    
    static func fetchMovies(completion: @escaping ([Movie]?) -> Void) {
        guard let url = URL(string: "\(baseURL)/movie/popular?api_key=\(apiKey)") else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("Error fetching movies: \(error.localizedDescription)")
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
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }
}

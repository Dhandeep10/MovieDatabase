//
//  MovieModel.swift
//  MovieDatabase
//
//  Created by Dhandeep  Singh on 29/12/23.
//

import Foundation

struct Movie: Codable {
    let title: String
    let overview: String
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
}

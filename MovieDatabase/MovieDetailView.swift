//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by Dhandeep  Singh on 29/12/23.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    var body: some View {
        VStack {
            Text(movie.title)
                .font(.title)
            Text("Release Date: \(movie.releaseDate)")
            Text("Rating: \(movie.voteAverage)")
            Text(movie.overview)
        }
        .padding()
        .navigationTitle(movie.title)
    }
}


#Preview {
    MovieDetailView(movie: Movie(title: "Sample Movie", overview: "Overview", posterPath: nil, releaseDate: "2022-01-01", voteAverage: 7.5))
}

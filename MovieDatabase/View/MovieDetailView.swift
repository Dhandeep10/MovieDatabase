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
            if let posterURL = movie.posterURL {
                // Display poster image
                AsyncImage(url: posterURL) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "photo") // Placeholder image for failure
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    @unknown default:
                        fatalError("Unhandled AsyncImage phase")
                    }
                }
                .frame(height: 200) // Adjust the height as needed
            }

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

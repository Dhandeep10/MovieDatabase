//
//  ContentView.swift
//  MovieDatabase
//
//  Created by Dhandeep  Singh on 29/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var movies: [Movie] = []

    var body: some View {
        NavigationView {
            List(movies, id: \.title) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    Text(movie.title)
                }
            }
            .onAppear {
                MovieService.fetchMovies { fetchedMovies in
                    if let fetchedMovies = fetchedMovies {
                        self.movies = fetchedMovies
                    }
                }
            }
            .navigationTitle("Movies")
        }
    }
}


#Preview {
    ContentView()
}

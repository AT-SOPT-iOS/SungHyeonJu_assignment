//
//  HomeViewModel.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var liveShows: [LiveShow] = []
    @Published var recommendedShows: [RecommendedShow] = []

    init() {
        loadDummyData()
    }

    private func loadDummyData() {
        self.movies = Movie.sampleMovies
        self.liveShows = LiveShow.sampleData
        self.recommendedShows = RecommendedShow.sampleData
    }
}

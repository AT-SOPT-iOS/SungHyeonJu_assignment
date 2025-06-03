//
//  Top20Section.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct Top20Section: View {
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 티빙 TOP 20")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(Array(movies.enumerated()), id: \.element.id) { index, movie in
                        RankingPosterCell(rank: index + 1, image: Image(movie.imageName))
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    Top20Section(movies: Movie.sampleMovies)
        .background(Color.black)
}

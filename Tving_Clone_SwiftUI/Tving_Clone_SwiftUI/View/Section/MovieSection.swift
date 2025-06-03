//
//  MovieSection.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct MovieSection: View {
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            Text("실시간 인기 영화")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(movies) { movie in
                        LongImgaeCell(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    MovieSection(movies: Movie.sampleMovies)
        .background(Color.black)
}

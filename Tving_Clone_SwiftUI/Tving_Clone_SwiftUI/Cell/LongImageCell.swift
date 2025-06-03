//
//  MovieCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct LongImgaeCell: View {
    let movie: Movie

    var body: some View {
        Image(movie.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 180)
            .clipped()
            .cornerRadius(8)
    }
}


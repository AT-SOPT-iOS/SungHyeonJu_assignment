//
//  MovieCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct MoviePosterCell: View {
    let image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 180)
            .clipped()
            .cornerRadius(8)
    }
}

//
//  LiveRankingCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct LiveRankingCell: View {
    let rank: Int
    let channel: String
    let title: String
    let rating: String
    let image: Image

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            image
                .resizable()
                .aspectRatio(16/9, contentMode: .fill)
                .frame(height: 170)
                .clipped()
                .cornerRadius(10)

            HStack(alignment: .top, spacing: 6) {
                Text("\(rank)")
                    .font(.system(size: 28, weight: .bold))
                    .italic()
                    .foregroundColor(.white)

                VStack(alignment: .leading, spacing: 2) {
                    Text(channel)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()

                    Text(title)
                        .font(.subheadline)
                        .foregroundColor(.white)

                    Text(rating)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

//
//  LiveRankingCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//
import SwiftUI

struct LiveRankingCell: View {
    let show: LiveShow

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(show.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 90)
                .clipped()
                .cornerRadius(10)

            HStack(alignment: .top, spacing: 6) {
                Text("\(show.rank)")
                    .font(.system(size: 28, weight: .bold))
                    .italic()
                    .foregroundColor(.white)

                VStack(alignment: .leading, spacing: 2) {
                    Text(show.channel)
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()

                    Text("\(show.title) \(show.episode)")
                        .font(.subheadline)
                        .foregroundColor(.white)

                    Text(show.rating)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
#Preview {
    LiveRankingCell(show: LiveShow.sampleData[0])
        .background(Color.black)
}

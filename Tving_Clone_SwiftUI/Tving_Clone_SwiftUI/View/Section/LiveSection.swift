//
//  LiveSection.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct LiveSection: View {
    let liveShows: [LiveShow]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("실시간 인기 LIVE")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text("더보기")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(liveShows) { show in
                        LiveRankingCell(show: show)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    LiveSection(liveShows: LiveShow.sampleData)
        .background(Color.black)
}

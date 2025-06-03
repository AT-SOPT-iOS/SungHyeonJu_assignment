//
//  RecommandSection.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct RecommandSection: View {
    let shows: [RecommendedShow]

    var body: some View {
        VStack(alignment: .leading) {
            Text("현주의 인생작 TOP 5")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(shows) { show in
                        RecommendedShowCell(show: show)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RecommandSection(shows: RecommendedShow.sampleData)
}

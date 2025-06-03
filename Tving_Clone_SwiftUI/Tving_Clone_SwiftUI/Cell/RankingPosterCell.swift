//
//  RankingPosterCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct RankingPosterCell: View {
    let rank: Int
    let image: Image

    var body: some View {
        HStack(alignment: .bottom, spacing: 8) {
            Text("\(rank)")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 40, alignment: .center)

            image
                .resizable()
                .aspectRatio(2/3, contentMode: .fill)
                .frame(width: 120, height: 180)
                .clipped()
                .cornerRadius(8)
        }
    }
}

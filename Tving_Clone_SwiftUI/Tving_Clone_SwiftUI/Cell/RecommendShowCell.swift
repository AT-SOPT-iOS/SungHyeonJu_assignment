//
//  RecommendShowCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct RecommendedShowCell: View {
    let show: RecommendedShow

    var body: some View {
        Image(show.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 160, height: 100)
            .clipped()
            .cornerRadius(8)
    }
}

#Preview {
    RecommendedShowCell(show: RecommendedShow.sampleData[0])
}

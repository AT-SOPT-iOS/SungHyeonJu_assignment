//
//  TeamLogoSection.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct TeamLogoSection: View {
    let teamLogos = ["dosan", "kia", "lg", "samsung", "dosan", "kia", "lg", "samsung"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(Array(teamLogos.enumerated()), id: \.offset) { index, logo in
                    TeamLogoCell(
                        image: Image(logo),
                        isEven: index % 2 == 0
                    )
                }
            }
        }
    }
}

#Preview {
    TeamLogoSection()
}

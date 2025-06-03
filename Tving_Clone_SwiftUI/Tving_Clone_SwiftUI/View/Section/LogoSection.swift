//
//  LogoSection.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct LogoSection: View {
    let logos = ["afc", "appleTV", "kbl", "kbo"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 7) {
                ForEach(logos, id: \.self) { imageName in
                    LogoCell(logo: Image(imageName))
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    LogoSection()
}

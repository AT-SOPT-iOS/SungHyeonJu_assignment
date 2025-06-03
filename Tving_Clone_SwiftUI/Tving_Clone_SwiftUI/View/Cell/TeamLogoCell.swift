//
//  TeamLogoCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct TeamLogoCell: View {
    let image: Image
    let isEven: Bool

    var body: some View {
        ZStack {
            (isEven ? Color.white : Color.black)
                .frame(width: 80, height: 50)

            image
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
    }
}

#Preview {
    HStack(spacing: 0) {
        TeamLogoCell(image: Image("kia"), isEven: true)
        TeamLogoCell(image: Image("lg"), isEven: false)
    }
}



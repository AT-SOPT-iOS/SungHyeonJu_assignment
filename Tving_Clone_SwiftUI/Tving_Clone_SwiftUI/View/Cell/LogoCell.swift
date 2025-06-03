//
//  LogoCell.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct LogoCell: View {
    let logo: Image

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(Color(red: 0.12, green: 0.12, blue: 0.12))
                .frame(width: 90, height: 45)

            logo
                .resizable()
                .scaledToFit()
                .frame(height: 34)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    LogoCell(logo: Image("kbo"))
}

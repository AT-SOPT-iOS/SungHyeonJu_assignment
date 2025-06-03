//
//  NavigationBar.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct NavigationBar: View {
    var body: some View {
        HStack {
            Image("tving")
                .resizable()
                .scaledToFit()
                .frame(height: 78)

            Spacer()

            Button(action: {
                print("검색 버튼 탭됨")
            }) {
                Image(systemName: "magnifyingglass")
                                   .foregroundColor(.white)
                                   .frame(width: 30, height: 30)
            }
            .padding(.trailing, 12)

            Button(action: {
                print("장바구니 버튼 탭됨")
            }) {
                Image("tvingIcon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 30)
            }
        }
        .frame(height: 44)
        .background(Color.black)
    }
}

#Preview {
    NavigationBar()
}


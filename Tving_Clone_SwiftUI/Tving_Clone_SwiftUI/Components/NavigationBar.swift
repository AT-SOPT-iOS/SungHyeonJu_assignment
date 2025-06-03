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
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(height: 28)

            Spacer()

            Button(action: {
                print("검색 버튼 탭됨")
            }) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
            }
            .padding(.trailing, 12)

            Button(action: {
                print("장바구니 버튼 탭됨")
            }) {
                Image(systemName: "cart")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
        .padding(.top, 8)
    }
}


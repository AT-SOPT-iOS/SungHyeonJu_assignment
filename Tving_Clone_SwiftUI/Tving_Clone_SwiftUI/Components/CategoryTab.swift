//
//  TabBar.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

enum CategoryTab: String, CaseIterable {
    case home = "홈"
    case drama = "드라마"
    case entertainment = "예능"
    case movie = "영화"
    case sports = "스포츠"
    case news = "뉴스"
}

struct CategoryTabBar: View {
    @Binding var selectedTab: CategoryTab

    var body: some View {
            HStack(spacing: 24) {
                ForEach(CategoryTab.allCases, id: \.self) { tab in
                    VStack(spacing: 4) {
                        Button(action: {
                            selectedTab = tab
                        }) {
                            Text(tab.rawValue)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.white)
                        }

                        Rectangle()
                            .fill(selectedTab == tab ? Color.white : Color.clear)
                            .frame(height: 2)
                            .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.horizontal)

        .background(Color.black)
    }
}

#Preview {
    struct PreviewContainer: View {
        @State private var selectedTab: CategoryTab = .home

        var body: some View {
            CategoryTabBar(selectedTab: $selectedTab)
                .background(Color.black)
        }
    }

    return PreviewContainer()
}


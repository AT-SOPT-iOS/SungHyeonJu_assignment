//
//  MainView.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab: CategoryTab = .home

    var body: some View {
        VStack(spacing: 0) {
            NavigationBar()
            CategoryTabBar(selectedTab: $selectedTab)

            TabView(selection: $selectedTab) {
                HomeView()
                    .tag(CategoryTab.home)

                PlaceholderView(title: "드라마")
                    .tag(CategoryTab.drama)

                PlaceholderView(title: "예능")
                    .tag(CategoryTab.entertainment)

                PlaceholderView(title: "영화")
                    .tag(CategoryTab.movie)

                PlaceholderView(title: "스포츠")
                    .tag(CategoryTab.sports)

                PlaceholderView(title: "뉴스")
                    .tag(CategoryTab.news)
            }
            .tabViewStyle(.page(indexDisplayMode: .never)) 
        }
        .background(Color.black)
    }
}

///테스트용으로 만든 뷰
struct PlaceholderView: View {
    let title: String

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text("\(title) 화면")
                .foregroundColor(.white)
                .font(.largeTitle)
        }
    }
}


#Preview {
    MainView()
}

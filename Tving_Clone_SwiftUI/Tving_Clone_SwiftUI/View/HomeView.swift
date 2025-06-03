//
//  HomeView.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//
import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                BannerImage()
                Top20Section(movies: viewModel.movies)
                LiveSection(liveShows: viewModel.liveShows)
                MovieSection(movies: viewModel.movies)
                TeamLogoSection()
                LogoSection()
                RecommandSection(shows: viewModel.recommendedShows)
            }
            .padding(.bottom, 20)
        }
        .background(Color.black.ignoresSafeArea())
    }
}

struct BannerImage: View {
    var body: some View {
        Image("whatYourName")
            .resizable()
            .scaledToFill()
            .frame(height: 600)
            .clipped()
    }
}

#Preview {
    HomeView()
}

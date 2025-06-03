//
//  HomeView.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//
import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                BannerImage()
                Top20Section(movies: Movie.sampleMovies)
                LiveSection(liveShows: LiveShow.sampleData)
                MovieSection(movies: Movie.sampleMovies)
                TeamLogoSection()
                LogoSection()
                RecommandSection(shows: RecommendedShow.sampleData)
            }
            .padding(.bottom, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
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


struct Top20Section: View {

    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 티빙 TOP 20")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(movies) { movie in
                        LongImgaeCell(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct LiveSection: View {
    let liveShows: [LiveShow]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("실시간 인기 LIVE")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Text("더보기")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(liveShows) { show in
                        LiveRankingCell(show: show)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


struct MovieSection: View {
    let movies: [Movie]

    var body: some View {
        VStack(alignment: .leading) {
            Text("실시간 인기 영화")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(movies) { movie in
                        LongImgaeCell(movie: movie)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

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

struct RecommandSection: View {
    let shows: [RecommendedShow]

    var body: some View {
        VStack(alignment: .leading) {
            Text("현주의 인생작 TOP 5")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(shows) { show in
                        RecommendedShowCell(show: show)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


#Preview {
    HomeView()
}

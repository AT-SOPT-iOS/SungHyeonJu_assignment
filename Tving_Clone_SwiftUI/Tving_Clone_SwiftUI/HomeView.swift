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
                Top20Section()
                LiveSection()
                MovieSection()
                TeamLogoSection()
                LogoSection()
                PdPickSection()
            }
            .padding(.bottom, 20)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}

struct BannerImage: View {
    var body: some View {
        Rectangle()
            .fill(Color.gray)
            .frame(height: 200)
            .cornerRadius(10)
            .padding(.horizontal)
    }
}

struct Top20Section: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("오늘의 티빙 TOP 20")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(1..<6) { index in
                        RankingPosterCell(
                            rank: index,
                            image: Image(systemName: "photo")
                        )
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct LiveSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("실시간 인기 LIVE")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(0..<3) { index in
                        LiveRankingCell(
                            rank: index + 1,
                            channel: "JTBC",
                            title: "이혼숙려캠프 34화",
                            rating: "27.2%",
                            image: Image(systemName: "photo") 
                        )
                        .frame(width: 300)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct MovieSection: View {
    let movies: [Image] = [
        Image(systemName: "photo"), Image(systemName: "photo"), Image(systemName: "photo")
    ]

    var body: some View {
        VStack(alignment: .leading) {
            Text("실시간 인기 영화")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(0..<movies.count, id: \.self) { index in
                        MoviePosterCell(image: movies[index])
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


struct TeamLogoSection: View {
    let teamLogos = ["doosan", "kia", "lg", "samsung", "ssg"]

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
    let logos = ["applelogo", "tv", "play.rectangle", "sportscourt", "soccerball"]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(logos, id: \.self) { systemName in
                    LogoCell(logo: Image(systemName: systemName))
                }
            }
            .padding(.horizontal)
        }
    }
}


struct PdPickSection: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("감각적인 PD의 인생작 TOP 5")
                .font(.headline)
                .foregroundColor(.white)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<3) { _ in
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 160, height: 100)
                            .cornerRadius(8)
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

//
//  HomeModel.swift
//  Tving_Clone_SwiftUI
//
//  Created by 성현주 on 6/3/25.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct LiveRanking: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct LiveShow: Identifiable {
    let id = UUID()
    let rank: Int
    let channel: String
    let title: String
    let episode: String
    let rating: String
    let imageName: String
}

struct RecommendedShow: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}


// MARK: - 더미 데이터
extension RecommendedShow {
    static let sampleData: [RecommendedShow] = [
        RecommendedShow(title: "지구오락실2", imageName: "earthArcade3"),
        RecommendedShow(title: "전공의생활", imageName: "residentLife"),
        RecommendedShow(title: "런위드숭실", imageName: "runWithSJ")
    ]
}

extension LiveShow {
    static let sampleData: [LiveShow] = [
        LiveShow(rank: 1, channel: "JTBC", title: "이혼숙려캠프", episode: "34화", rating: "27.2%", imageName: "divorceInsurance"),
        LiveShow(rank: 2, channel: "뿅뿅지구오락실", title: "별들에게 물어봐", episode: "14화", rating: "24.1%", imageName: "askToStar"),
        LiveShow(rank: 3, channel: "JTBC", title: "이혼숙려캠프", episode: "34화", rating: "27.2%", imageName: "divorceInsurance"),
        LiveShow(rank: 4, channel: "JTBC", title: "이혼숙려캠프", episode: "34화", rating: "27.2%", imageName: "divorceInsurance"),
        LiveShow(rank: 5, channel: "JTBC", title: "이혼숙려캠프", episode: "34화", rating: "27.2%", imageName: "divorceInsurance"),
        LiveShow(rank: 6, channel: "JTBC", title: "이혼숙려캠프", episode: "34화", rating: "27.2%", imageName: "divorceInsurance"),
        LiveShow(rank: 7, channel: "JTBC", title: "이혼숙려캠프", episode: "34화", rating: "27.2%", imageName: "divorceInsurance")
    ]
}

extension Movie {
    static let sampleMovies: [Movie] = [
        Movie(title: "signal", imageName: "signal"),
        Movie(title: "suzume", imageName: "suzume"),
        Movie(title: "theRoadOfTheRings", imageName: "theRoadOfTheRings"),
        Movie(title: "whatYourName", imageName: "whatYourName"),
        Movie(title: "harryPorter", imageName: "harryPorter")
    ]
}


extension LiveRanking {
    static let sampleLiveRanking: [LiveRanking] = [
        LiveRanking(title: "signal", imageName: "signal"),
        LiveRanking(title: "suzume", imageName: "suzume"),
        LiveRanking(title: "theRoadOfTheRings", imageName: "theRoadOfTheRings"),
        LiveRanking(title: "whatYourName", imageName: "whatYourName"),
        LiveRanking(title: "harryPorter", imageName: "harryPorter")
    ]
}

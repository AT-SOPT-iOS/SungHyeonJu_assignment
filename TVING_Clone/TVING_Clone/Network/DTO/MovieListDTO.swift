//
//  MovieListDTO.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/12/25.
//

import Foundation

struct WeeklyBoxOfficeResponse: Codable {
    let boxOfficeResult: BoxOfficeResult
}

struct BoxOfficeResult: Codable {
    let weeklyBoxOfficeList: [WeeklyBoxOffice]
}

struct WeeklyBoxOffice: Codable {
    let rank: String
    let movieNm: String
    let audiCnt: String
    let openDt: String

}

struct LiveSectionWrapper {
    let models: [LiveChannelModel]

    init(from response: WeeklyBoxOfficeResponse) {
        self.models = response.boxOfficeResult.weeklyBoxOfficeList.map {
            LiveChannelModel(
                image: nil,
                ranking: Int($0.rank) ?? 0,
                channel: $0.movieNm,
                title: $0.openDt,
                percentage: "\($0.audiCnt)명"
            )
        }
    }
}

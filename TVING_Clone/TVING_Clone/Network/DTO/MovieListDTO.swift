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

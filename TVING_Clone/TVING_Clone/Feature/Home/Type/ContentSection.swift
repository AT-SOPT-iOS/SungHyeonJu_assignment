//
//  ContentSection.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import Foundation

enum ContentSection: Int, CaseIterable {
    case top20, live, movie, baseballLogos, serviceLogos, pdPick

    var title: String {
        switch self {
        case .top20: return "오늘의 티빙 TOP 20"
        case .live: return "실시간 인기 LIVE"
        case .movie: return "실시간 인기 영화"
        case .baseballLogos, .serviceLogos: return ""
        case .pdPick: return "현주의 인생작 TOP 6"
        }
    }

    var hasHeader: Bool {
        switch self {
        case .baseballLogos, .serviceLogos: return false
        default: return true
        }
    }
}


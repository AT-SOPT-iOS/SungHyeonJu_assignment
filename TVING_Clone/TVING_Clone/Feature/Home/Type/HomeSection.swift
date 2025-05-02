//
//  HomeSection.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

enum HomeSection: Int, CaseIterable {
    case mainPoster, top20, live, movie, baseballLogos, serviceLogos, recommand

    var title: String {
        switch self {
        case .mainPoster, .baseballLogos, .serviceLogos: return ""
        case .top20: return "오늘의 티빙 TOP 20"
        case .live: return "실시간 인기 LIVE"
        case .movie: return "실시간 인기 영화"
        case .recommand: return "현주의 인생작 TOP 5"
        }
    }

    var hasHeader: Bool {
        return ![.baseballLogos, .serviceLogos].contains(self)
    }

    var hasFooter: Bool {
        return self == .recommand
    }
}

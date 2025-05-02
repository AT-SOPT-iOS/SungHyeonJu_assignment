//
//  HomeModel.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

enum HomeModel {
    case mainPoster([ImagePosterModel])
    case todayTop20([Top20Model])
    case live([LiveChannelModel])
    case movie([ImagePosterModel])
    case baseballLogos([ImagePosterModel])
    case serviceLogos([ImagePosterModel])
    case recommand([ImagePosterModel])
}

struct Top20Model {
    let ranking: Int
    let image: UIImage?
}

struct LiveChannelModel {
    let image: UIImage?
    let ranking: Int
    let channel: String
    let title: String
    let percentage: String
}

struct ImagePosterModel {
    let image: UIImage?
}

extension HomeModel {
    var itemCount: Int {
        switch self {
        case .mainPoster(let items),
             .movie(let items),
             .recommand(let items),
             .serviceLogos(let items),
             .baseballLogos(let items):
            return items.count

        case .todayTop20(let items):
            return items.count

        case .live(let items):
            return items.count
        }
    }
}

// MARK: - 더미 데이터

extension HomeModel {
    // swiftlint:disable:next function_body_length
    static func dummy() -> [HomeModel] {
        return [
            .mainPoster([
                ImagePosterModel(image: ImageLiterals.whatYourName)
                    ]),
            // MARK: - 오늘의 TOP 20 (Shorts)
            .todayTop20([
                Top20Model(ranking: 1, image: ImageLiterals.signal),
                Top20Model(ranking: 2, image: ImageLiterals.harryPorter),
                Top20Model(ranking: 3, image: ImageLiterals.theRoadOfTheRings),
                Top20Model(ranking: 4, image: ImageLiterals.signal),
                Top20Model(ranking: 5, image: ImageLiterals.harryPorter),
                Top20Model(ranking: 6, image: ImageLiterals.theRoadOfTheRings)
            ]),

            // MARK: - 실시간 인기 LIVE (Long)
            .live([
                LiveChannelModel(image: ImageLiterals.transitLove3, ranking: 1, channel: "JTBC", title: "이혼숙려캠프 34화", percentage: "27.2%"),
                LiveChannelModel(image: ImageLiterals.earthArcade3, ranking: 2, channel: "KBS", title: "별들에게 물어봐", percentage: "24.1%"),
                LiveChannelModel(image: ImageLiterals.residentLife, ranking: 3, channel: "KBS", title: "별들에게 물어봐", percentage: "24.1%"),
                LiveChannelModel(image: ImageLiterals.runWithSJ, ranking: 4, channel: "KBS", title: "별들에게 물어봐", percentage: "24.1%"),
                LiveChannelModel(image: ImageLiterals.askToStar, ranking: 5, channel: "KBS", title: "별들에게 물어봐", percentage: "24.1%"),
                LiveChannelModel(image: ImageLiterals.askToStar, ranking: 6, channel: "KBS", title: "별들에게 물어봐", percentage: "24.1%")
            ]),

            // MARK: - 실시간 인기 영화 (Shorts)
            .movie([
                ImagePosterModel(image: ImageLiterals.signal),
                ImagePosterModel(image: ImageLiterals.harryPorter),
                ImagePosterModel(image: ImageLiterals.theRoadOfTheRings),
                ImagePosterModel(image: ImageLiterals.signal),
                ImagePosterModel(image: ImageLiterals.harryPorter),
                ImagePosterModel(image: ImageLiterals.theRoadOfTheRings)
            ]),

            // MARK: - 야구 로고 (Shorts)
            .baseballLogos([
                ImagePosterModel(image: ImageLiterals.dosan),
                ImagePosterModel(image: ImageLiterals.kia),
                ImagePosterModel(image: ImageLiterals.samsung),
                ImagePosterModel(image: ImageLiterals.lg),
                ImagePosterModel(image: ImageLiterals.dosan),
                ImagePosterModel(image: ImageLiterals.kia),
                ImagePosterModel(image: ImageLiterals.samsung),
                ImagePosterModel(image: ImageLiterals.lg)
            ]),

            // MARK: - 서비스 로고 (Shorts)
            .serviceLogos([
                ImagePosterModel(image: .appleTV),
                ImagePosterModel(image: .kbl),
                ImagePosterModel(image: .afc),
                ImagePosterModel(image: .kbo),
                ImagePosterModel(image: .appleTV),
                ImagePosterModel(image: .kbl),
                ImagePosterModel(image: .afc),
                ImagePosterModel(image: .kbo)
            ]),

            // MARK: - PD 추천작 (Long)
            .recommand([
                ImagePosterModel(image: ImageLiterals.earthArcade3),
                ImagePosterModel(image: ImageLiterals.transitLove3),
                ImagePosterModel(image: ImageLiterals.earthArcade3),
                ImagePosterModel(image: ImageLiterals.transitLove3),
                ImagePosterModel(image: ImageLiterals.earthArcade3),
                ImagePosterModel(image: ImageLiterals.transitLove3)
            ])
        ]
    }
}

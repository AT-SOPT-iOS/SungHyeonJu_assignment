//
//  HomeSection.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

enum HomeSection: Int, CaseIterable {
    case top20, live, movie, baseballLogos, serviceLogos, recommand

    var title: String {
        switch self {
        case .top20: return "오늘의 티빙 TOP 20"
        case .live: return "실시간 인기 LIVE"
        case .movie: return "실시간 인기 영화"
        case .baseballLogos: return ""
        case .serviceLogos: return ""
        case .recommand: return "현주의 인생작 TOP 5"
        }
    }

    var hasHeader: Bool {
        return self != .baseballLogos && self != .serviceLogos
    }

    func createLayoutSection() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize
        let groupSize: NSCollectionLayoutSize

        switch self {
        case .top20:
            itemSize = .init(widthDimension: .absolute(140), heightDimension: .absolute(160))
            groupSize = .init(widthDimension: .estimated(100), heightDimension: .absolute(160))
        case .live:
            itemSize = .init(widthDimension: .absolute(200), heightDimension: .absolute(200))
            groupSize = .init(widthDimension: .estimated(200), heightDimension: .absolute(200))
        case .movie:
            itemSize = .init(widthDimension: .absolute(100), heightDimension: .absolute(150))
            groupSize = .init(widthDimension: .estimated(100), heightDimension: .absolute(150))
        case .baseballLogos:
            itemSize = .init(widthDimension: .absolute(60), heightDimension: .absolute(60))
            groupSize = .init(widthDimension: .estimated(60), heightDimension: .absolute(60))
        case .serviceLogos:
            itemSize = .init(widthDimension: .absolute(90), heightDimension: .absolute(44))
            groupSize = .init(widthDimension: .estimated(90), heightDimension: .absolute(44))
        case .recommand:
            itemSize = .init(widthDimension: .absolute(200), heightDimension: .absolute(120))
            groupSize = .init(widthDimension: .estimated(200), heightDimension: .absolute(120))
        }

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = (self == .baseballLogos || self == .serviceLogos) ? 12 : 8

        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: (self == .serviceLogos ? 32 : (self == .baseballLogos ? 16 : 24)),
            trailing: 16
        )

        if hasHeader {
            section.boundarySupplementaryItems = [
                NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(36)),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
            ]
        }

        return section
    }

    var cellReuseIdentifier: String {
        switch self {
        case .live: return LiveChannelCell.reuseIdentifier
        case .top20: return TodayTop20Cell.reuseIdentifier
        default: return ImageCollectionViewCell.reuseIdentifier
        }
    }
}

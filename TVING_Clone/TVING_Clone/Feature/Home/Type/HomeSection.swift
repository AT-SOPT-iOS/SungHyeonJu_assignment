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
        case .mainPoster: return ""
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

    var itemSize: NSCollectionLayoutSize {
        switch self {
        case .top20:
            return .init(widthDimension: .absolute(140), heightDimension: .absolute(160))
        case .live:
            return .init(widthDimension: .absolute(200), heightDimension: .absolute(200))
        case .movie:
            return .init(widthDimension: .absolute(100), heightDimension: .absolute(150))
        case .baseballLogos:
            return .init(widthDimension: .absolute(80), heightDimension: .absolute(50))
        case .serviceLogos:
            return .init(widthDimension: .absolute(90), heightDimension: .absolute(44))
        case .recommand:
            return .init(widthDimension: .absolute(200), heightDimension: .absolute(120))
        case .mainPoster:
            return .init(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        }
    }

    var groupSize: NSCollectionLayoutSize {
        switch self {
        case .top20:
            return .init(widthDimension: .estimated(100), heightDimension: .absolute(160))
        case .live:
            return .init(widthDimension: .estimated(200), heightDimension: .absolute(200))
        case .movie:
            return .init(widthDimension: .estimated(100), heightDimension: .absolute(150))
        case .baseballLogos:
            return .init(widthDimension: .estimated(80), heightDimension: .absolute(50))
        case .serviceLogos:
            return .init(widthDimension: .estimated(90), heightDimension: .absolute(44))
        case .recommand:
            return .init(widthDimension: .estimated(200), heightDimension: .absolute(120))
        case .mainPoster:
            return .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(600))
        }
    }

    func createLayoutSection() -> NSCollectionLayoutSection {
        //main poster 고정
        if self == .mainPoster {
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            return NSCollectionLayoutSection(group: group).then {
                $0.contentInsets = .zero
            }
        }

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = (self == .baseballLogos || self == .serviceLogos) ? 12 : 8

        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 16,
            bottom: bottomInset,
            trailing: 16
        )

        if hasHeader {
            section.boundarySupplementaryItems.append(
                NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(36)),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
            )
        }

        if self == .recommand {
            section.boundarySupplementaryItems.append(
                NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(120)),
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
            )
        }
        return section
    }

    private var bottomInset: CGFloat {
        switch self {
        case .serviceLogos: return 32
        case .baseballLogos: return 16
        default: return 24
        }
    }

    var cellReuseIdentifier: String {
        switch self {
        case .live: return LiveChannelCell.reuseIdentifier
        case .top20: return TodayTop20Cell.reuseIdentifier
        default: return ImageCollectionViewCell.reuseIdentifier
        }
    }
}

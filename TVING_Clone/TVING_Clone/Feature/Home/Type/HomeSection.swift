//
//  HomeSection.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

enum HomeSection: Int, CaseIterable {
    case live, movie, baseballLogos, serviceLogos, pdPick, top20

    var title: String {
        switch self {
        case .live: return "인기 LIVE 채널"
        case .movie: return "인기 영화"
        case .baseballLogos: return ""
        case .serviceLogos: return ""
        case .pdPick: return "PD 추천 작품"
        case .top20: return "티빙 TOP 20"
        }
    }

    var hasHeader: Bool {
        return self != .baseballLogos && self != .serviceLogos
    }

    func createLayoutSection() -> NSCollectionLayoutSection {
        let itemSize: NSCollectionLayoutSize
        let groupSize: NSCollectionLayoutSize

        switch self {
        case .live:
            itemSize = .init(widthDimension: .absolute(200), heightDimension: .absolute(120))
            groupSize = .init(widthDimension: .estimated(200), heightDimension: .absolute(120))
        case .movie:
            itemSize = .init(widthDimension: .absolute(100), heightDimension: .absolute(150))
            groupSize = .init(widthDimension: .estimated(100), heightDimension: .absolute(150))
        case .baseballLogos:
            itemSize = .init(widthDimension: .absolute(60), heightDimension: .absolute(60))
            groupSize = .init(widthDimension: .estimated(60), heightDimension: .absolute(60))
        case .serviceLogos:
            itemSize = .init(widthDimension: .absolute(90), heightDimension: .absolute(44))
            groupSize = .init(widthDimension: .estimated(90), heightDimension: .absolute(44))
        case .pdPick:
            itemSize = .init(widthDimension: .absolute(200), heightDimension: .absolute(120))
            groupSize = .init(widthDimension: .estimated(200), heightDimension: .absolute(120))
        case .top20:
            itemSize = .init(widthDimension: .absolute(100), heightDimension: .absolute(160))
            groupSize = .init(widthDimension: .estimated(100), heightDimension: .absolute(160))
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
}

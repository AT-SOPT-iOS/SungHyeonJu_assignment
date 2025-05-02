//
//  HomeSectionLayoutProvider.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/2/25.
//

import Foundation
import UIKit

struct HomeSectionLayoutProvider {
    static func layout(for section: HomeSection) -> NSCollectionLayoutSection {
        let itemSize = section.itemSize
        let groupSize = section.groupSize

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let layoutSection = NSCollectionLayoutSection(group: group)

        if section == .mainPoster {
            layoutSection.contentInsets = .zero
            return layoutSection
        }

        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.interGroupSpacing = section.interGroupSpacing
        layoutSection.contentInsets = .init(top: 0, leading: 16, bottom: section.bottomInset, trailing: 16)

        if section.hasHeader {
            layoutSection.boundarySupplementaryItems.append(
                .init(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(36)),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
            )
        }

        if section.hasFooter {
            layoutSection.boundarySupplementaryItems.append(
                .init(
                    layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120)),
                    elementKind: UICollectionView.elementKindSectionFooter,
                    alignment: .bottom
                )
            )
        }

        return layoutSection
    }
}

// MARK: - Section Style Extensions

private extension HomeSection {
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
        case .mainPoster:
            return .init(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(600))
        default:
            return .init(widthDimension: .estimated(200), heightDimension: itemSize.heightDimension)
        }
    }

    var bottomInset: CGFloat {
        switch self {
        case .serviceLogos: return 32
        case .baseballLogos: return 16
        default: return 24
        }
    }

    var interGroupSpacing: CGFloat {
        return self == .baseballLogos || self == .serviceLogos ? 12 : 8
    }
}

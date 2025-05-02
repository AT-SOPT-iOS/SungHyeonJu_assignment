//
//  SupplementaryViewFactory.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/2/25.
//

import UIKit

struct SupplementaryViewFactory {
    static func makeView(
        kind: String,
        at indexPath: IndexPath,
        in collectionView: UICollectionView,
        homeData: [HomeModel]
    ) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let section = HomeSection(rawValue: indexPath.section) else {
                return UICollectionReusableView()
            }

            let header = collectionView.dequeueHeaderView(type: SectionHeaderView.self, forIndexPath: indexPath)

            let style: SectionHeaderView.HeaderStyle
            switch section {
            case .live, .movie:
                style = .titleWithMoreButton
            case .recommand:
                style = .titleWithPageControl
            default:
                style = .titleOnly
            }

            header.configure(
                title: section.title,
                style: style,
                page: 0,
                // TODO: 실제 값으로 바꾸기
                totalPages: 3
            )
            return header

        case UICollectionView.elementKindSectionFooter:
            return collectionView.dequeueFooterView(type: FooterView.self, forIndexPath: indexPath)

        default:
            return UICollectionReusableView()
        }
    }
}

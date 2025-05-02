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
            header.configure(title: section.title)
            return header

        case UICollectionView.elementKindSectionFooter:
            return collectionView.dequeueFooterView(type: FooterView.self, forIndexPath: indexPath)

        default:
            return UICollectionReusableView()
        }
    }
}

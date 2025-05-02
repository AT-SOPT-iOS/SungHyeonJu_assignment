//
//  HomeView.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit
import SnapKit

final class HomeView: BaseUIView {

    // MARK: - UI Components
    let collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ in
            guard let section = HomeSection(rawValue: sectionIndex) else { return nil }
            return section.createLayoutSection()
        }
    ).then {
        $0.backgroundColor = .black
    }

    // MARK: - Custum Method
    override func setUI() {
        addSubview(collectionView)
        registerCell()
    }
    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    // MARK: - private methods
    private func registerCell() {
        collectionView.register(cell: TodayTop20Cell.self)
        collectionView.register(cell: LiveChannelCell.self)
        collectionView.register(cell: ImageCollectionViewCell.self)
        collectionView.registerHeaderView(reusableView: SectionHeaderView.self)
        collectionView.registerFooterView(reusableView: FooterView.self)
    }
}

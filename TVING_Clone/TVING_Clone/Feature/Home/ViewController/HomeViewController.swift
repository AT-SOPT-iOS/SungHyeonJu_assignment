//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

final class HomeViewController: BaseUIViewController {

    // MARK: - UI Components
    private let homeView = HomeView()

    // MARK: - Custom Method
    override func setUI() {
        view.addSubview(homeView)
    }

    override func setLayout() {
        homeView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    override func setDelegate() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return HomeSection.allCases.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // 더미 데이터
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = HomeSection(rawValue: indexPath.section) else {
            return UICollectionViewCell()
        }

        let identifier = section.cellReuseIdentifier

        switch section {
        case .live:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: identifier,
                for: indexPath
            ) as? LiveChannelCell else {
                assertionFailure("LiveChannelCell 캐스팅 실패")
                return UICollectionViewCell()
            }

            cell.configure(
                image: .tvingLogo,
                ranking: indexPath.item + 1,
                channel: "JTBC",
                title: "이혼숙려캠프 34화",
                percentage: "27.2%"
            )
            return cell

        case .top20:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: identifier,
                for: indexPath
            ) as? TodayTop20Cell else {
                assertionFailure("TodayTop20Cell 캐스팅 실패")
                return UICollectionViewCell()
            }

            cell.configure(
                image: .tvingLogo, 
                ranking: indexPath.item + 1
            )
            return cell

        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: identifier,
                for: indexPath
            ) as? ImageCollectionViewCell else {
                assertionFailure("ImageCollectionViewCell 캐스팅 실패")
                return UICollectionViewCell()
            }

            cell.configure(image: .tvingLogo)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let section = HomeSection(rawValue: indexPath.section),
              kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }

        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HomeView.SectionHeaderView.reuseIdentifier,
            for: indexPath
        ) as? HomeView.SectionHeaderView else {
            assertionFailure("SectionHeaderView 캐스팅 실패")
            return UICollectionReusableView()
        }

        header.configure(title: section.title)
        return header
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {}

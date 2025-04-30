//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

final class HomeViewController: BaseUIViewController {

    // MARK: - Data
    private let homeData: [HomeSectionModel] = HomeSectionModel.dummy()

    // MARK: - UI Components
    private let homeView = HomeView()

    // MARK: - Life Cycle
    override func setUI() {
        view.addSubview(homeView)
    }

    override func setLayout() {
        homeView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }

    override func setDelegate() {
        homeView.collectionView.delegate = self
        homeView.collectionView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeData.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch homeData[section] {
        case .todayTop20(let items): return items.count
        case .live(let items): return items.count
        case .movie(let items): return items.count
        case .baseballLogos(let items): return items.count
        case .serviceLogos(let items): return items.count
        case .pdPick(let items): return items.count
        }
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel = homeData[indexPath.section]

        switch sectionModel {
        case .todayTop20(let items):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TodayTop20Cell.reuseIdentifier,
                for: indexPath
            ) as? TodayTop20Cell else {
                assertionFailure("TodayTop20Cell 캐스팅 실패")
                return UICollectionViewCell()
            }
            let model = items[indexPath.item]
            cell.configure(image: model.image, ranking: model.ranking)
            return cell

        case .live(let items):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LiveChannelCell.reuseIdentifier,
                for: indexPath
            ) as? LiveChannelCell else {
                assertionFailure("LiveChannelCell 캐스팅 실패")
                return UICollectionViewCell()
            }
            let model = items[indexPath.item]
            cell.configure(
                image: model.image,
                ranking: model.ranking,
                channel: model.channel,
                title: model.title,
                percentage: model.percentage
            )
            return cell

        case .movie(let items),
             .baseballLogos(let items),
             .serviceLogos(let items),
             .pdPick(let items):
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ImageCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as? ImageCollectionViewCell else {
                assertionFailure("ImageCollectionViewCell 캐스팅 실패")
                return UICollectionViewCell()
            }
            let model = items[indexPath.item]
            cell.configure(image: model.image)
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

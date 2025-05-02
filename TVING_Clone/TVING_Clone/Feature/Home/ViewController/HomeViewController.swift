//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

final class HomeViewController: BaseUIViewController {

    // MARK: - DummyData
    private let homeData: [HomeModel] = HomeModel.dummy()

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
        case .recommand(let items): return items.count
        case .mainPoster(let items): return items.count

        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel = homeData[indexPath.section]

        switch sectionModel {
        case .mainPoster(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .mainPoster)
            return cell

        case .movie(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .movie)
            return cell

        case .recommand(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .recommand)
            return cell

        case .serviceLogos(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            cell.configure(image: items[indexPath.item].image, style: .serviceLogo)
            return cell

        case .baseballLogos(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            let bgColor = indexPath.item % 2 == 0 ? UIColor.white : UIColor.black
            cell.configure(image: items[indexPath.item].image, style: .baseball, backgroundColorOverride: bgColor)
            return cell

        case .todayTop20(let items):
            let model = items[indexPath.item]
            let cell = collectionView.dequeueReusableCell(type: TodayTop20Cell.self, forIndexPath: indexPath)
            cell.configure(image: model.image, ranking: model.ranking)
            return cell

        case .live(let items):
            let model = items[indexPath.item]
            let cell = collectionView.dequeueReusableCell(type: LiveChannelCell.self, forIndexPath: indexPath)
            cell.configure(
                image: model.image,
                ranking: model.ranking,
                channel: model.channel,
                title: model.title,
                percentage: model.percentage
            )
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

        let header = collectionView.dequeueHeaderView(type: HomeView.SectionHeaderView.self, forIndexPath: indexPath)
        header.configure(title: section.title)
        return header
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {}

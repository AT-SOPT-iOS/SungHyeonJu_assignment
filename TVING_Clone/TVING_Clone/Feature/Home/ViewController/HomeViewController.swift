//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

final class HomeViewController: BaseUIViewController {

    // MARK: - DummyData
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
        case .mainPoster(let items): return items.count

        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel = homeData[indexPath.section]

        switch sectionModel {
        case .mainPoster(let items),
             .movie(let items),
             .serviceLogos(let items),
             .pdPick(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            let model = items[indexPath.item]
            cell.configure(image: model.image)

            if case .mainPoster = sectionModel {
                cell.setCornerRadius(0)
                cell.applyLayoutStyle(.fullFill)
            }  else {
                cell.setCornerRadius(8)
                cell.applyLayoutStyle(.fullFill)
            }

            return cell

        case .todayTop20(let items):
            let cell = collectionView.dequeueReusableCell(type: TodayTop20Cell.self, forIndexPath: indexPath)
            let model = items[indexPath.item]
            cell.configure(image: model.image, ranking: model.ranking)
            return cell

        case .live(let items):
            let cell = collectionView.dequeueReusableCell(type: LiveChannelCell.self, forIndexPath: indexPath)
            let model = items[indexPath.item]
            cell.configure(
                image: model.image,
                ranking: model.ranking,
                channel: model.channel,
                title: model.title,
                percentage: model.percentage
            )
            return cell

        case .baseballLogos(let items):
            let cell = collectionView.dequeueReusableCell(type: ImageCollectionViewCell.self, forIndexPath: indexPath)
            let model = items[indexPath.item]
            cell.configure(image: model.image)
            cell.setCornerRadius(0)
            cell.setBackgroundColor(indexPath.item % 2 == 0 ? .white : .black)
            cell.applyLayoutStyle(.centerFit)
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

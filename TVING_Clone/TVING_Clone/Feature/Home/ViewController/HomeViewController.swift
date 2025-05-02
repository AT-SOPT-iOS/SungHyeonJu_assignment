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
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
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
        return homeData.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeData[section].itemCount
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionModel = homeData[indexPath.section]
        return HomeCellFactory.makeCell(for: sectionModel, at: indexPath, in: collectionView)
    }

    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        return SupplementaryViewFactory.makeView(kind: kind, at: indexPath, in: collectionView, homeData: homeData)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {}

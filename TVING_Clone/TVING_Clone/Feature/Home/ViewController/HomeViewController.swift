//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

final class HomeViewController: BaseUIViewController {

    // MARK: - DummyData
    private var homeData: [HomeModel] = HomeModel.dummy()

    // MARK: - UI Components
    let homeView = HomeView()

    // MARK: - Life Cycle
    override func setUI() {
        view.addSubview(homeView)
        fetchLiveBoxOfficeData()
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

// MARK: - Network
extension HomeViewController {
    private func fetchLiveBoxOfficeData() {
        Task {
            do {
                let reponse = try await MovieListService.shared.fetchLiveSectionWrapper(date: "20240501")
                print(reponse)

                //항상 3번째 위치할거 같아서 간단하게 모델 교채
                if case .live = homeData[2] {
                    homeData[2] = .live(reponse.models)
                }

                self.homeView.collectionView.reloadData()
            } catch {
                print("API 실패nㅠㅠㅠㅠㅠ: \(error)")
            }
        }
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

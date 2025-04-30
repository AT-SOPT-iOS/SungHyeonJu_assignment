//
//  HomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

final class HomeViewController: BaseUIViewController {

    // MARK: - Properties

    // MARK: - UIComponent

    private let homeView = HomeView()

    // MARK: - Life Cycle

//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }

    // MARK: - Custom Method

    override func setUI() {
        view.addSubviews(homeView)
    }

    override func setLayout() {
        homeView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func addTarget() {
    }

    // MARK: - ActionMethod

    // MARK: - PrivateMethod

    // MARK: - HelperMethod
}

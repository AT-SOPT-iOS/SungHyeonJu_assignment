//
//  AppHomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

final class AppHomeViewController: BaseUIViewController {

    // MARK: - UI Components
    private let categoryTabBar = CategoryTabBarView()
    private lazy var pageViewController: UIPageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal,
        options: nil).then {_ in
    }

    // MARK: - Properties
    private lazy var viewControllers: [UIViewController] = {
        return [
            ContentViewController(title: "테스트"),
            LoginViewController(),
            LoginViewController(),
            WelcomeViewController(),
            LoginViewController(),
            WelcomeViewController()
        ]
    }()

    private var currentIndex = 0

    // MARK: - Life Cycle

    // MARK: - UI Setup
    override func setUI() {
        addChild(pageViewController)

        view.addSubviews(
            categoryTabBar,
            pageViewController.view
        )

        pageViewController.setViewControllers(
            [viewControllers.first].compactMap { $0 },
            direction: .forward,
            animated: false
        )

        pageViewController.didMove(toParent: self)
    }

    override func setLayout() {
        categoryTabBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }

        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(categoryTabBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

    override func setDelegate() {
        categoryTabBar.delegate = self
        pageViewController.delegate = self
        pageViewController.dataSource = self
    }
}

// MARK: - CategoryTabBarViewDelegate
extension AppHomeViewController: CategoryTabBarViewDelegate {
    func didSelectCategory(index: Int) {
        let direction: UIPageViewController.NavigationDirection = index > currentIndex ? .forward : .reverse

        currentIndex = index

        pageViewController.setViewControllers(
            [viewControllers[index]],
            direction: direction,
            animated: true
        )
    }
}

// MARK: - UIPageViewControllerDataSource
extension AppHomeViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index > 0 else { return nil }
        return viewControllers[index - 1]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = viewControllers.firstIndex(of: viewController), index < viewControllers.count - 1 else { return nil }
        return viewControllers[index + 1]
    }
}

// MARK: - UIPageViewControllerDelegate
extension AppHomeViewController: UIPageViewControllerDelegate {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        guard completed,
              let currentVC = pageViewController.viewControllers?.first,
              let index = viewControllers.firstIndex(of: currentVC) else { return }

        currentIndex = index
        categoryTabBar.moveIndicator(to: index)
    }
}

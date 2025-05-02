//
//  AppHomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit
import SnapKit

final class AppHomeViewController: BaseUIViewController {

    // MARK: - Constants
    private let hideThreshold: CGFloat = 80

    // MARK: - UI Components
    private let categoryTabBar = CategoryTabBarView()
    private let pageViewController = UIPageViewController(
        transitionStyle: .scroll,
        navigationOrientation: .horizontal
    )
    private let indicatorView = IndicatorView()

    // MARK: - Constraints
    private var indicatorTopConstraint: Constraint?
    private var tabBarTopConstraint: Constraint?

    // MARK: - State
    private var currentIndex = 0
    private var currentVisibilityState: IndicatorVisibilityState = .visible

    // MARK: - View Controllers
    private lazy var viewControllers: [UIViewController] = [
        HomeViewController(),
        LoginViewController(),
        LoginViewController(),
        WelcomeViewController(),
        LoginViewController(),
        WelcomeViewController()
    ]

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }

    // MARK: - UI Setup
    override func setUI() {
        addChild(pageViewController)

        view.addSubviews(
            indicatorView,
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
        indicatorView.snp.makeConstraints {
            indicatorTopConstraint = $0.top.equalTo(view.safeAreaLayoutGuide).constraint
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }

        categoryTabBar.snp.makeConstraints {
            tabBarTopConstraint = $0.top.equalTo(indicatorView.snp.bottom).constraint
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

        if let homeVC = viewControllers.first as? HomeViewController {
            homeVC.homeView.collectionView.delegate = self
        }
    }
}

// MARK: - Scroll Delegate
extension AppHomeViewController: UIScrollViewDelegate, UICollectionViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y

        if offsetY > hideThreshold && currentVisibilityState != .hidden {
            animateIndicatorTransition(to: .hidden)
        } else if offsetY <= hideThreshold && currentVisibilityState != .visible {
            animateIndicatorTransition(to: .visible)
        }
    }
}

// MARK: - PageView, TabBar Delegate
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

        if let homeVC = currentVC as? HomeViewController {
            homeVC.homeView.collectionView.delegate = self
        }
    }
}

// MARK: - Indicator Transition
private extension AppHomeViewController {
    enum IndicatorVisibilityState {
        case visible
        case hidden

        var alpha: CGFloat {
            switch self {
            case .visible: return 1
            case .hidden: return 0
            }
        }

        var offset: CGFloat {
            switch self {
            case .visible: return 0
            case .hidden: return -48
            }
        }
    }

    private func updateTabBarConstraints(for state: IndicatorVisibilityState) {
        tabBarTopConstraint?.deactivate()

        categoryTabBar.snp.remakeConstraints {
            switch state {
            case .visible:
                tabBarTopConstraint = $0.top.equalTo(indicatorView.snp.bottom).constraint
            case .hidden:
                tabBarTopConstraint = $0.top.equalTo(view.safeAreaLayoutGuide).constraint
            }
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }

        indicatorTopConstraint?.update(offset: state.offset)
    }

    private func animateIndicatorTransition(to state: IndicatorVisibilityState) {
        guard currentVisibilityState != state else { return }

        updateTabBarConstraints(for: state)

        UIView.animate(withDuration: 0.25) {
            self.indicatorView.alpha = state.alpha
            self.view.layoutIfNeeded()
        }

        currentVisibilityState = state
    }
}

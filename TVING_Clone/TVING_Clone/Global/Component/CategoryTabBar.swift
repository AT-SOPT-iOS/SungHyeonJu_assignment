//
//  CategoryTabBar.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit
import SnapKit

protocol CategoryTabBarViewDelegate: AnyObject {
    func didSelectCategory(index: Int)
}

final class CategoryTabBarView: BaseUIView {

    // MARK: - Properties
    private let categories = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    private var buttons: [TextButton] = []

    private var indicatorCenterXConstraint: Constraint?
    private var indicatorWidthConstraint: Constraint?
    private var didInitialLayout = false

    weak var delegate: CategoryTabBarViewDelegate?

    // MARK: - UI Components
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
    }

    private let indicatorView = UIView().then {
        $0.backgroundColor = .white
    }

    // MARK: - Setup
    override func setUI() {
        backgroundColor = .black

        addSubview(stackView)
        addSubview(indicatorView)

        for (index, title) in categories.enumerated() {
            let button = TextButton()
            button.text = title
            button.style = .tabBar
            button.tag = index
            button.addTarget(self, action: #selector(categoryTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }
    }

    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        indicatorView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.bottom.equalToSuperview()
        }

        moveIndicator(to: 0)
    }

    // MARK: - Action Method
    @objc
    private func categoryTapped(_ sender: UIButton) {
        moveIndicator(to: sender.tag)
        delegate?.didSelectCategory(index: sender.tag)
    }

    func moveIndicator(to index: Int) {
        guard index < buttons.count else { return }

        let targetButton = buttons[index]
        let titleWidth = targetButton.titleLabel?.intrinsicContentSize.width ?? 0

        indicatorCenterXConstraint?.deactivate()
        indicatorWidthConstraint?.deactivate()

        indicatorView.snp.remakeConstraints {
            $0.height.equalTo(2)
            $0.bottom.equalToSuperview()
            indicatorCenterXConstraint = $0.centerX.equalTo(targetButton.snp.centerX).constraint
            indicatorWidthConstraint = $0.width.equalTo(titleWidth).constraint
        }

        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
    }
}

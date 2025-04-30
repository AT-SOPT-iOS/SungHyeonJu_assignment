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

final class CategoryTabBarView: UIView {

    // MARK: - Properties
    private let categories = ["홈", "드라마", "예능", "영화", "스포츠", "뉴스"]
    private var buttons: [TextButton] = []

    private var indicatorCenterXConstraint: Constraint?
    private var indicatorWidthConstraint: Constraint?

    weak var delegate: CategoryTabBarViewDelegate?

    // MARK: - UI Components
    private let stackView = UIStackView()
    private let indicatorView = UIView()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
        layoutIfNeeded()
        moveIndicator(to: 0)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func configureUI() {
        backgroundColor = .black

        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        for (index, title) in categories.enumerated() {
            let button = TextButton()
            button.text = title
            button.style = .tabBar
            button.tag = index
            button.addTarget(self, action: #selector(categoryTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            stackView.addArrangedSubview(button)
        }

        indicatorView.backgroundColor = .white
    }

    private func configureLayout() {
        addSubview(stackView)
        addSubview(indicatorView)

        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        guard let firstButton = buttons.first,
              let titleLabel = firstButton.titleLabel else { return }

        indicatorView.snp.makeConstraints {
            $0.height.equalTo(2)
            $0.bottom.equalToSuperview()
            indicatorCenterXConstraint = $0.centerX.equalTo(firstButton.snp.centerX).constraint
            indicatorWidthConstraint = $0.width.equalTo(titleLabel.intrinsicContentSize.width).constraint
        }
    }

    // MARK: - Actions
    @objc
    private func categoryTapped(_ sender: UIButton) {
        moveIndicator(to: sender.tag)
        delegate?.didSelectCategory(index: sender.tag)
    }

    func moveIndicator(to index: Int) {
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

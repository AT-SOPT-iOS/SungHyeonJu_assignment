//
//  SectionHeaderView.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/2/25.
//

import UIKit
import SnapKit

final class SectionHeaderView: UICollectionReusableView {

    static let reuseIdentifier = "SectionHeaderView"

    enum HeaderStyle {
        case titleOnly
        case titleWithMoreButton
        case titleWithPageControl
    }

    // MARK: - UI Components

    private let titleLabel = UILabel().then {
        $0.font = .header
        $0.textColor = .white
    }

    private let moreButton = TextButton().then {
        $0.text = "더보기"
        $0.style = .secondary
        $0.isHidden = true
    }

    private let pageControl = UIPageControl().then {
        $0.currentPageIndicatorTintColor = .white
        $0.pageIndicatorTintColor = .darkGray
        $0.numberOfPages = 3
        $0.isHidden = true
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Layout
    private func setupLayout() {
        addSubviews(titleLabel, moreButton, pageControl)

        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
        }

        moreButton.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }

        pageControl.snp.makeConstraints {
            $0.trailing.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }

    // MARK: - Configuration
    func configure(title: String, style: HeaderStyle, page: Int = 0, totalPages: Int = 0) {
        titleLabel.text = title
        moreButton.isHidden = true
        pageControl.isHidden = true

        switch style {
        case .titleOnly:
            break

        case .titleWithMoreButton:
            moreButton.isHidden = false

        case .titleWithPageControl:
            pageControl.isHidden = false
            pageControl.numberOfPages = totalPages
            pageControl.currentPage = page
        }
    }

    func updatePage(current: Int) {
        pageControl.currentPage = current
    }
}

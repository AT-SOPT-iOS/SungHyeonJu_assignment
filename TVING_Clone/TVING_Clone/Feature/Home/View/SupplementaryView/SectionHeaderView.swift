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

    // MARK: - UI Components
    private let titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 18)
        $0.textColor = .white
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
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(9)
        }
    }
}

// MARK: - Configure
extension SectionHeaderView {
    func configure(title: String) {
        titleLabel.text = title
    }
}

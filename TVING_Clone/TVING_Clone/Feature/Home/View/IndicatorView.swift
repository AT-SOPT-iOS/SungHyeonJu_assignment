//
//  IndicatorView.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/2/25.
//

import UIKit
import SnapKit

final class IndicatorView: BaseUIView {

    // MARK: - UI Components
    private let logoImageView = UIImageView().then {
        $0.image = .tving
        $0.contentMode = .scaleAspectFit
    }

    private let searchButton = UIButton().then {
        $0.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        $0.tintColor = .white
    }

    private let userButton = UIButton().then {
        $0.setImage(.tvingIcon, for: .normal)
        $0.imageView?.contentMode = .scaleAspectFit
    }

    // MARK: - Setup
    override func setUI() {
        backgroundColor = .black
        addSubviews(logoImageView, searchButton, userButton)
    }

    override func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.height.equalTo(78)
            $0.width.lessThanOrEqualTo(191)
        }

        userButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(30)
        }

        searchButton.snp.makeConstraints {
            $0.trailing.equalTo(userButton.snp.leading).offset(-16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(30)
        }
    }
}

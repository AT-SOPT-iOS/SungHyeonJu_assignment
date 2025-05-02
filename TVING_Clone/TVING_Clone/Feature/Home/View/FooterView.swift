//
//  FooterView.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/2/25.
//

import UIKit
import SnapKit

final class FooterView: UICollectionReusableView {

    static let reuseIdentifier = "FooterView"

    // MARK: - UI Components

    private let noticeBoxView = UIView().then {
        $0.backgroundColor = .gray5
        $0.layer.cornerRadius = 4
    }

    private let noticeLabel = UILabel().then {
        $0.text = "공지"
        $0.font = .systemFont(ofSize: 13, weight: .medium)
        $0.textColor = .lightGray
    }

    private let noticeMessageLabel = UILabel().then {
        $0.text = "티빙 계정 공유 정책 추가 안내"
        $0.font = .systemFont(ofSize: 13, weight: .regular)
        $0.textColor = .white
    }

    private let chevronImageView = UIImageView().then {
        $0.image = UIImage(systemName: "chevron.right")
        $0.tintColor = .white
    }

    private let firstRowLabel = UILabel().then {
        $0.text = "고객문의 · 이용약관 · 개인정보처리방침"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
    }

    private let secondRowLabel = UILabel().then {
        $0.text = "사업자정보 · 인재채용"
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
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
        addSubview(noticeBoxView)
        addSubview(firstRowLabel)
        addSubview(secondRowLabel)

        [noticeLabel, noticeMessageLabel, chevronImageView].forEach {
            noticeBoxView.addSubview($0)
        }

        noticeBoxView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }

        noticeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.centerY.equalToSuperview()
        }

        noticeMessageLabel.snp.makeConstraints {
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(8)
            $0.centerY.equalToSuperview()
        }

        chevronImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(12)
        }

        firstRowLabel.snp.makeConstraints {
            $0.top.equalTo(noticeBoxView.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }

        secondRowLabel.snp.makeConstraints {
            $0.top.equalTo(firstRowLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
    }
}

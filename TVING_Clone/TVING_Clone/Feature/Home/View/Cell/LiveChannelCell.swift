//
//  LiveChannelCell.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit
import SnapKit

final class LiveChannelCell: UICollectionViewCell {

    static let reuseIdentifier = "LiveChannelCell"

    // MARK: - UI Components

    private let thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }

    private let rankingLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 24)
        $0.textColor = .white
    }

    private let channelLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 13)
        $0.textColor = .white
    }

    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
    }

    private let percentageLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupUI() {
        contentView.addSubviews(
            thumbnailImageView,
            rankingLabel,
            channelLabel,
            titleLabel,
            percentageLabel
        )
    }

    private func setupLayout() {
        thumbnailImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(thumbnailImageView.snp.width).multipliedBy(9.0/16.0)
        }

        rankingLabel.snp.makeConstraints {
            $0.top.equalTo(thumbnailImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(4)
        }

        channelLabel.snp.makeConstraints {
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(rankingLabel)
        }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(channelLabel.snp.bottom).offset(4)
            $0.leading.equalTo(rankingLabel)
        }

        percentageLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(2)
            $0.leading.equalTo(rankingLabel)
        }
    }

    // MARK: - Configure

    func configure(
        image: UIImage?,
        ranking: Int,
        channel: String,
        title: String,
        percentage: String
    ) {
        thumbnailImageView.image = image
        rankingLabel.text = "\(ranking)"
        channelLabel.text = channel
        titleLabel.text = title
        percentageLabel.text = percentage
    }
}

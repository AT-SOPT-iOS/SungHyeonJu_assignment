//
//  TodayTop20Cell.swift
//  TVING_Clone
//
//  Created by 성현주 on 2025/05/01.
//

import UIKit
import SnapKit

final class TodayTop20Cell: UICollectionViewCell {

    static let reuseIdentifier = "TodayTop20Cell"

    // MARK: - UI Components

    private let rankingLabel = UILabel().then {
        let fontDescriptor = UIFontDescriptor
            .preferredFontDescriptor(withTextStyle: .largeTitle)
            .withSymbolicTraits([.traitBold, .traitItalic]) ?? UIFontDescriptor()

        $0.font = UIFont(descriptor: fontDescriptor, size: 40)
        $0.textColor = .white
        $0.textAlignment = .left
    }


    private let thumbnailImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 8
        $0.backgroundColor = .darkGray
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
        contentView.addSubview(rankingLabel)
        contentView.addSubview(thumbnailImageView)

        rankingLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(8)
        }

        thumbnailImageView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.leading.equalTo(rankingLabel.snp.trailing)
            $0.width.equalTo(thumbnailImageView.snp.height).multipliedBy(2/3.0) // 2:3 비율
        }
    }

    // MARK: - Configure

    func configure(image: UIImage?, ranking: Int) {
        rankingLabel.text = "\(ranking)"
        thumbnailImageView.image = image
    }
}

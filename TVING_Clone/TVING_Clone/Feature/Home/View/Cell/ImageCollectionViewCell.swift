//
//  ImageCollectionViewCell.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit
import SnapKit

final class ImageCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifier = "ImageCollectionViewCell"

    // MARK: - Type
    enum ImageLayoutStyle {
        case fullFill    // 꽉 채우는 방식
        case centerFit   // 가운데 정렬 + 비율 유지
    }

    // MARK: - UI
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 8
        applyLayoutStyle(.fullFill) // 기본 레이아웃 스타일
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure
    func configure(image: UIImage?) {
        imageView.image = image
    }

    func setCornerRadius(_ radius: CGFloat) {
        contentView.layer.cornerRadius = radius
    }

    func setBackgroundColor(_ color: UIColor) {
        contentView.backgroundColor = color
    }

    func applyLayoutStyle(_ style: ImageLayoutStyle) {
        imageView.snp.removeConstraints() // 기존 제약 제거

        switch style {
        case .fullFill:
            imageView.contentMode = .scaleAspectFill
            imageView.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }

        case .centerFit:
            imageView.contentMode = .scaleAspectFit
            imageView.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.width.lessThanOrEqualToSuperview().multipliedBy(0.8)
                $0.height.lessThanOrEqualToSuperview().multipliedBy(0.8)
            }
        }
    }
}

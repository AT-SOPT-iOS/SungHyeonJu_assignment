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
    enum Style {
        case mainPoster
        case recommand
        case movie
        case serviceLogo
        case baseball

        var layoutStyle: ImageLayoutStyle {
            switch self {
            case .mainPoster, .movie, .recommand:
                return .fullFill
            case .serviceLogo, .baseball:
                return .centerFit
            }
        }

        var cornerRadius: CGFloat {
            switch self {
            case .mainPoster, .baseball:
                return 0
            default:
                return 8
            }
        }

        var backgroundColor: UIColor? {
            switch self {
            case .serviceLogo:
                return .gray3
            default:
                return nil
            }
        }
    }

    enum ImageLayoutStyle {
        case fullFill
        case centerFit
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
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure
    func configure(image: UIImage?, style: Style, backgroundColorOverride: UIColor? = nil) {
        imageView.image = image
        contentView.layer.cornerRadius = style.cornerRadius
        contentView.backgroundColor = backgroundColorOverride ?? style.backgroundColor ?? .gray
        applyLayoutStyle(style.layoutStyle)
    }

    private func applyLayoutStyle(_ style: ImageLayoutStyle) {
        imageView.snp.removeConstraints()

        switch style {
        case .fullFill:
            imageView.contentMode = .scaleAspectFill
            imageView.snp.makeConstraints { $0.edges.equalToSuperview() }

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

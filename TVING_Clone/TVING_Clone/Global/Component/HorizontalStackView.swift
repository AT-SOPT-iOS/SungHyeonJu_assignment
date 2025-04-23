//
//  HorizontalStackView.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

final class HorizontalStackView: UIStackView {
    init(views: [UIView], spacing: CGFloat = 33) {
        super.init(frame: .zero)
        views.forEach { self.addArrangedSubview($0) }
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = .center
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  BoxButton.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

public final class BoxButton: UIButton {

    // MARK: - Button Type Enum

    public enum ButtonStyle {
        case filled
        case outline
        case disabled
    }

    // MARK: - Public Properties

    public var style: ButtonStyle = .filled {
        didSet {
            applyStyle()
        }
    }

    public var cornerRadius: CGFloat = 3 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    // MARK: - Init

    public init(title: String, style: ButtonStyle = .filled) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.style = style
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setup() {
        titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        applyStyle()
    }

    // MARK: - Style Logic

    private func applyStyle() {
        switch style {
        case .filled:
            backgroundColor = UIColor.systemRed
            setTitleColor(.white, for: .normal)
            layer.borderWidth = 0

        case .outline:
            backgroundColor = .clear
            setTitleColor(.lightGray, for: .normal)
            layer.borderColor = UIColor.lightGray.cgColor
            layer.borderWidth = 1

        case .disabled:
            backgroundColor = UIColor.systemGray5
            setTitleColor(.systemGray, for: .normal)
            isUserInteractionEnabled = false
            layer.borderWidth = 0
        }
    }
}

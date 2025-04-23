//
//  BoxButton.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

public final class BoxButton: UIButton, AppButtonProtocol {

    // MARK: - type
    public enum BoxButtonType {
        case filled
        case outline
    }

    // MARK: - public interface

    public var style: BoxButtonType = .filled {
        didSet {
            applyStyle()
        }
    }

    public var cornerRadius: CGFloat = 3 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    public var isDisabled: Bool = false {
        didSet {
            isUserInteractionEnabled = !isDisabled
            style = isDisabled ? .outline : .filled
        }
    }

    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
            applyStyle()
        }
    }

    // MARK: - Init

    public init(title: String, style: BoxButtonType = .filled) {
        super.init(frame: .zero)
        self.text = title
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
        setTitle(text, for: .normal)
        applyStyle()
    }

    // MARK: - Style 적용

    private func applyStyle() {
        switch style {
        case .filled:
            backgroundColor = UIColor.systemRed
            setTitleColor(.white, for: .normal)
            layer.borderWidth = 0
            layer.borderColor = nil

        case .outline:
            backgroundColor = .clear
            setTitleColor(.lightGray, for: .normal)
            layer.borderColor = UIColor.gray4.cgColor
            layer.borderWidth = 1
        }
    }
}

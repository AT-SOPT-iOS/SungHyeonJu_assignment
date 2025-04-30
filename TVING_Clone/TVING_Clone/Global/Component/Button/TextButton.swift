//
//  TextButton.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

public final class TextButton: UIButton, AppButtonProtocol {

    // MARK: - Type
    public enum TextButtonType {
        case secondary   // 일반 진한 회색 텍스트
        case tertiary    // 흐릿한 안내 텍스트
        case link        // 밑줄 강조된 텍스트
        case tabBar
    }

    // MARK: - Public interface

    public var style: TextButtonType = .secondary {
        didSet {
            setUI()
        }
    }

    public var isDisabled: Bool = false {
        didSet {
            isEnabled = !isDisabled
        }
    }

    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
            setUI()
        }
    }

    // MARK: - Init
    public init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup
    private func setup() {
        titleLabel?.font = .button
        contentHorizontalAlignment = .center
        setTitle(text, for: .normal)
        setUI()
    }

    // MARK: - setUI

    private func setUI() {
        backgroundColor = .clear

        switch style {
        case .secondary:
            titleLabel?.font = .button
            setTitleColor(.gray2, for: .normal)
            setAttributedTitle(nil, for: .normal)

        case .tertiary:
            titleLabel?.font = .button
            setTitleColor(.gray3, for: .normal)
            setAttributedTitle(nil, for: .normal)

        case .link:
            titleLabel?.font = .underlineButton
            underlineTitle()
        case .tabBar:
            titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
            setTitleColor(.white, for: .normal)
            setAttributedTitle(nil, for: .normal)
        }
    }
}

// MARK: - underline 처리
extension TextButton {
    private func underlineTitle() {
        guard let currentTitle = title( for: .normal) else { return }
        let attributed = NSAttributedString(string: currentTitle, attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: titleColor(for: .normal) ?? UIColor.label
        ])
        setAttributedTitle(attributed, for: .normal)
    }
}

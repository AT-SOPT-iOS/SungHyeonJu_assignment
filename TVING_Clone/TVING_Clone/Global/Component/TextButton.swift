//
//  TextButton.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

public final class TextButton: UIButton {

    // MARK: - 스타일 타입
    public enum Style {
        case secondary   // 일반 진한 회색 텍스트
        case tertiary    // 흐릿한 안내 텍스트
        case link        // 밑줄 강조된 텍스트
    }

    // MARK: - Properties
    public var style: Style = .secondary {
        didSet {
            setUI()
        }
    }

    // MARK: - Init
    public init(title: String, style: Style = .secondary) {
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
        titleLabel?.font = UIFont.systemFont(ofSize: 14)
        contentHorizontalAlignment = .center
        setUI()
    }

    // MARK: - setUI
    private func setUI() {
        backgroundColor = .clear

        switch style {
        case .secondary:
            titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            setTitleColor(.label, for: .normal)
            setAttributedTitle(nil, for: .normal)

        case .tertiary:
            titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            setTitleColor(.systemGray, for: .normal)
            setAttributedTitle(nil, for: .normal)

        case .link:
            titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
            underlineTitle()
        }
    }

    // MARK: - underline 처리
    private func underlineTitle() {
        guard let currentTitle = title(for: .normal) else { return }
        let attributed = NSAttributedString(string: currentTitle, attributes: [
            .underlineStyle: NSUnderlineStyle.single.rawValue,
            .foregroundColor: titleColor(for: .normal) ?? UIColor.label
        ])
        setAttributedTitle(attributed, for: .normal)
    }
}

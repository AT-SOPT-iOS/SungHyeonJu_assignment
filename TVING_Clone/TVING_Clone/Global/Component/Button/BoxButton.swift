//
//  BoxButton.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

public final class BoxButton: UIButton, AppButtonProtocol {

    // MARK: - Type
    public enum BoxButtonType {
        case filled
        case outline
    }

    // MARK: - Public interface
    public var style: BoxButtonType = .filled {
        didSet {
            setUI()
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
        layer.cornerRadius = cornerRadius
        clipsToBounds = true
        setTitle(text, for: .normal)
        setUI()
    }

    // MARK: - setUI

    private func setUI() {
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

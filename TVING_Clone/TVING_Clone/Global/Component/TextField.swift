//
//  TextField.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit
import SnapKit

protocol TextFieldValidating {
    var isValid: Bool { get }
}

protocol TextFieldValidatingDelegate: AnyObject {
    func textFieldValidityDidChange()
}

final class TextField: UITextField {

    // MARK: - Type
    public enum FieldType {
        case normal
        case password
    }

    // MARK: - Public Properties
    public var type: FieldType = .normal {
        didSet {
            configureFieldType()
        }
    }

    weak var validationDelegate: TextFieldValidatingDelegate?

    // MARK: - UI Properties
    private let focusedBorderColor = UIColor.gray2.cgColor
    private let defaultBorderColor = UIColor.clear.cgColor
    private var isSecure: Bool = true

    private let clearButton = UIButton().then {
        $0.setImage(.icXcircle, for: .normal)
        $0.tintColor = .gray2
    }

    private let toggleButton = UIButton().then {
        $0.setImage(.icEyeSlash, for: .normal)
        $0.tintColor = .gray2
    }

    private var rightStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 8
        $0.alignment = .center
    }

    private lazy var rightContainerView: UIView = {
        let view = UIView()
        view.addSubview(rightStackView)
        rightStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(14)
        }
        return view
    }()

    // MARK: - Init
    public init() {
        super.init(frame: .zero)
        configureUI()
        configureActions()
        configureLayout()
        configureFieldType()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UI Configuration
    private func configureUI() {
        font = .systemFont(ofSize: 15, weight: .medium)
        textColor = .gray2
        backgroundColor = .gray4
        layer.cornerRadius = 3
        layer.borderWidth = 1
        layer.borderColor = defaultBorderColor
        addLeftPadding(width: 22)

        autocapitalizationType = .none
        clearButtonMode = .never
        rightView = rightContainerView
    }

    private func configureFieldType() {
        rightStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

        switch type {
        case .normal:
            isSecureTextEntry = false
            rightStackView.addArrangedSubview(clearButton)
        case .password:
            isSecureTextEntry = isSecure
            rightStackView.addArrangedSubview(clearButton)
            rightStackView.addArrangedSubview(toggleButton)
        }

        updateRightViewVisibility()
    }

    private func configureLayout() {
        clearButton.snp.makeConstraints {
            $0.size.equalTo(20)
        }

        toggleButton.snp.makeConstraints {
            $0.size.equalTo(20)
        }
    }

    // MARK: - Actions
    private func configureActions() {
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)

        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    // MARK: - Action Methods
    @objc private func clearText() {
        self.text = ""
        sendActions(for: .editingChanged)
    }

    @objc private func togglePasswordVisibility() {
        isSecure.toggle()
        isSecureTextEntry = isSecure
    }

    @objc private func editingDidBegin() {
        layer.borderColor = focusedBorderColor
        updateRightViewVisibility()
    }

    @objc private func editingDidEnd() {
        layer.borderColor = defaultBorderColor
        updateRightViewVisibility()
    }

    @objc private func textDidChange() {
        updateRightViewVisibility()
        validationDelegate?.textFieldValidityDidChange()
    }

    // MARK: - Helper
    private func updateRightViewVisibility() {
        rightViewMode = (text?.isEmpty == false) ? .always : .never
    }
}


extension TextField: TextFieldValidating {
    var isValid: Bool {
        return !(self.text?.isEmpty ?? true)
    }
}

//
//  TextField.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit
import SnapKit

protocol TextFieldValidatingDelegate: AnyObject {
    func textFieldValidityDidChange()
}

final class TextField: UITextField, AppTextFieldProtocol {

    // MARK: - Type
    public enum FieldType {
        case normal
        case password
    }

    // MARK: - Public Interface
    public var type: FieldType = .normal {
        didSet { configureFieldType() }
    }

    public var validationType: [ValidationType] = [.nonEmpty]

    public var isValid: Bool {
        return validationType.allSatisfy { $0.validate(text) }
    }

    public var textFieldPlaceholder: String? {
        didSet {
            super.placeholder = textFieldPlaceholder
            attributedPlaceholder = NSAttributedString(
                string: textFieldPlaceholder ?? "",
                attributes: [.foregroundColor: UIColor.gray2]
            )
        }
    }


    weak var validationDelegate: TextFieldValidatingDelegate?

    // MARK: - Private Properties
    private let focusedBorderColor = UIColor.gray2.cgColor
    private let defaultBorderColor = UIColor.clear.cgColor
    private var isSecure: Bool = true

    // MARK: - UI Components
    private let clearButton = UIButton().then {
        $0.setImage(.icXcircle, for: .normal)
        $0.tintColor = .gray2
    }

    private let toggleButton = UIButton().then {
        $0.setImage(.icEyeSlash, for: .normal)
        $0.tintColor = .gray2
    }

    private let rightStackView = UIStackView().then {
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

    // MARK: - UI Config
    private func configureUI() {
        font = .textField
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

    private func configureLayout() {
        clearButton.snp.makeConstraints { $0.size.equalTo(20) }
        toggleButton.snp.makeConstraints { $0.size.equalTo(20) }
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

    // MARK: - Actions
    private func configureActions() {
        clearButton.addTarget(self, action: #selector(clearText), for: .touchUpInside)
        toggleButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        addTarget(self, action: #selector(editingDidBegin), for: .editingDidBegin)
        addTarget(self, action: #selector(editingDidEnd), for: .editingDidEnd)
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    @objc private func clearText() {
        text = ""
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

    private func updateRightViewVisibility() {
        rightViewMode = (text?.isEmpty == false) ? .always : .never
    }
}

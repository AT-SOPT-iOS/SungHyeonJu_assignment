//
//  LoginViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit
import SnapKit

final class LoginViewController: BaseUIViewController {

    // MARK: - UI Components
    private let idTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "아이디"
        textField.setPlaceholder(color: .gray2)
        return textField
    }()
    
    private let pwTextField: TextField = {
        let textField = TextField()
        textField.placeholder = "비밀번호"
        textField.setPlaceholder(color: .gray2)
        return textField
    }()

    private let loginButton = BoxButton(title: "로그인하기", style: .outline)

    private let findIDButton = TextButton(title: "아이디 찾기", style: .secondary)
    private let findPWButton = TextButton(title: "비밀번호 찾기", style: .secondary)

    private let signupGuideButton = TextButton(title: "아직 계정이 없으신가요?", style: .tertiary)
    private let makeNicknameButton = TextButton(title: "닉네임 만들러가기", style: .link)


    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray3
        view.snp.makeConstraints { $0.width.equalTo(1); $0.height.equalTo(12) }
        return view
    }()

    private lazy var findAccountStack = HorizontalStackView(
        views: [findIDButton, separatorView, findPWButton],
        spacing: 33
    )

    private lazy var signupStack = HorizontalStackView(
        views: [signupGuideButton, makeNicknameButton],
        spacing: 33
    )

    // MARK: - UI Setup

    override func setUI() {
        [idTextField, pwTextField, loginButton, findAccountStack, signupStack]
            .forEach { view.addSubview($0) }
    }

    override func setLayout() {

        idTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }

        pwTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(7)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(pwTextField.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }

        findAccountStack.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(36)
            $0.centerX.equalToSuperview()
        }

        signupStack.snp.makeConstraints {
            $0.top.equalTo(findAccountStack.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
        }
    }
}

//
//  LoginViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit
import SnapKit
import Then

final class LoginViewController: BaseUIViewController {

    // MARK: - UI Components

    private let idTextField = TextField().then {
        $0.placeholder = "아이디"
        $0.setPlaceholder(color: .gray2)
    }

    private let pwTextField = TextField().then {
        $0.placeholder = "비밀번호"
        $0.setPlaceholder(color: .gray2)
    }

    private let loginButton = BoxButton().then {
        $0.text =  "로그인하기"
        $0.isDisabled = true
    }

    private let findIDButton = TextButton().then {
        $0.text = "아이디 찾기"
        $0.style = .secondary
    }

    private let findPWButton = TextButton().then {
        $0.text = "비밀번호 찾기"
        $0.style = .secondary
    }

    private let signupGuideButton = TextButton().then {
        $0.text = "아직 계정이 없으신가요?"
        $0.style = .tertiary
    }

    private let makeNicknameButton = TextButton().then {
        $0.text = "닉네임 만들러가기"
        $0.style = .link
    }

    private let separatorView = UIView().then {
        $0.backgroundColor = .systemGray3
    }

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

        separatorView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }
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

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

    // MARK: - Properties

    private var nickName: String?

    // MARK: - UI Components

    private let welcomeLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.text = "TVING ID 로그인"
        $0.numberOfLines = 2
        $0.font = .head1
    }

    private let idTextField = TextField().then {
        $0.textFieldPlaceholder = "아이디"
        $0.validationType = [.email]
    }

    private let pwTextField = TextField().then {
        $0.textFieldPlaceholder = "비밀번호"
        $0.type = .password
        $0.validationType = [.nonEmpty, .minLength(10)]
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

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Custom Method

    override func setUI() {
        [welcomeLabel,idTextField, pwTextField, loginButton, findAccountStack, signupStack]
            .forEach { view.addSubview($0) }
    }

    override func setDelegate() {
        [idTextField, pwTextField].forEach {
            $0.validationDelegate = self
        }
    }

    override func setLayout() {

        welcomeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(90)
        }

        separatorView.snp.makeConstraints {
            $0.width.equalTo(1)
            $0.height.equalTo(12)
        }

        idTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(31)
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

    override func addTarget() {
        loginButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
        makeNicknameButton.addTarget(self, action: #selector(makeNicknameButtonDidTap), for: .touchUpInside)
    }

    //MARK: - ActionMethod

    @objc
    private func loginButtonDidTap() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.dataBind(email: idTextField.text, nickName: nickName)
        navigationController?.pushViewController(welcomeVC, animated: true)
    }

    @objc
    private func makeNicknameButtonDidTap() {
        let nicknameVC = SetNickNameViewController()
        nicknameVC.modalPresentationStyle = .pageSheet
        nicknameVC.delegate = self
        if let sheet = nicknameVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.prefersGrabberVisible = true
        }
        present(nicknameVC, animated: true, completion: nil)
    }

}

extension LoginViewController : TextFieldValidatingDelegate {
    func textFieldValidityDidChange() {
        let fields = [idTextField, pwTextField]
        loginButton.isDisabled = !fields.allSatisfy { $0.isValid }
    }
}

extension LoginViewController: NickNameBindDelegate {
    func nickNameBind(nickName: String) {
        self.nickName = nickName
        print("닉네임 전달받음: \(nickName)")
    }
}

//
//  SetNickNameViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

protocol NickNameBindDelegate: AnyObject {
    func nickNameBind(nickName: String)
}

final class SetNickNameViewController: BaseUIViewController {

    // MARK: - Properties
    weak var delegate: NickNameBindDelegate?

    // MARK: - UIComponent
    private let welcomeLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.text = "닉네임을 입력해주세요."
        $0.numberOfLines = 2
        $0.font = .head1
    }

    private let nickNameTextField = TextField().then {
        $0.textFieldPlaceholder = "닉네임"
        $0.setPlaceholder(color: .white)
        $0.backgroundColor = .gray2
        $0.textColor = .black
        $0.validationType = [.koreanOnly]
    }

    private let saveButton = BoxButton().then {
        $0.text =  "저장하기"
        $0.cornerRadius = 12
        $0.isDisabled = true
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

    }

    // MARK: - Custom Method

    override func setUI() {
        [welcomeLabel, nickNameTextField, saveButton]
            .forEach { view.addSubview($0) }
    }

    override func setDelegate() {
        nickNameTextField.validationDelegate = self
    }

    override func addTarget() {
        saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
    override func setLayout() {

        welcomeLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(45)
        }

        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }

        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }

    // MARK: - ActionMethod

    @objc
    private func saveButtonDidTap() {
        guard let nickname = nickNameTextField.text, !nickname.isEmpty else { return }
        delegate?.nickNameBind(nickName: nickname)
        dismiss(animated: true)
    }

    // MARK: - PrivateMethod

}

// MARK: - TextFieldValidatingDelegate
extension SetNickNameViewController: TextFieldValidatingDelegate {
    func textFieldValidityDidChange() {
        let fields = [nickNameTextField]
        saveButton.isDisabled = !fields.allSatisfy { $0.isValid }
    }
}

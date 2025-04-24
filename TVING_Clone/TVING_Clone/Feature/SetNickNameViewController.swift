//
//  SetNickNameViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

final class SetNickNameViewController: BaseUIViewController {

    // MARK: - Properties

    // MARK: - UIComponent

    private let nickNameTextField = TextField().then {
        $0.placeholder = "닉네임을 입력해주세요."
        $0.setPlaceholder(color: .gray2)
        $0.validationType = [.nonEmpty]
    }

    private let saveButton = BoxButton().then {
        $0.text =  "로그인하기"
        $0.isDisabled = true
    }

    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
    }

    //MARK: - Custom Method

    override func setUI() {
        [nickNameTextField, saveButton]
            .forEach { view.addSubview($0) }
    }

    override func setDelegate() {
        nickNameTextField.validationDelegate = self
    }

    override func setLayout() {
        nickNameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(80)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }

        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }

    //MARK: - PrivateMethod

    //MARK: - HelperMethod

}


//MARK: - TextFieldValidatingDelegate
extension SetNickNameViewController : TextFieldValidatingDelegate {
    func textFieldValidityDidChange() {
        let fields = [nickNameTextField]
        saveButton.isDisabled = !fields.allSatisfy { $0.isValid }
    }
}


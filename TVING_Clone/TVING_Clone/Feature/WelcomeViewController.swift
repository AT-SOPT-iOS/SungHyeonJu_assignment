//
//  WelcomeViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

final class WelcomeViewController: BaseUIViewController {

    // MARK: - Properties
    private var email: String?
    private var nickName: String?

    // MARK: - UIComponent

    private let welcomeLabel = UILabel().then {
        $0.textColor = .white
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.font = .head1
    }

    private let tvingLogoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiterals.tvingLogo
        return imageView
    }()

    private let mainButton = BoxButton().then {
        $0.text =  "메인으로"
        $0.isDisabled = false
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }

    // MARK: - Custom Method

    override func setUI() {
        [welcomeLabel, tvingLogoView, mainButton]
            .forEach { view.addSubview($0) }
    }

    override func setLayout() {
        tvingLogoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(210)
        }

        welcomeLabel.snp.makeConstraints {
            $0.top.equalTo(tvingLogoView.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
        }

        mainButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(60)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }

    override func addTarget() {
        mainButton.addTarget(self, action: #selector(mainButtonDidTap), for: .touchUpInside)
    }

    // MARK: - ActionMethod
    @objc
    private func mainButtonDidTap() {
        let appHomeVC = AppHomeViewController()
        let navigationController = UINavigationController(rootViewController: appHomeVC)
        navigationController.modalPresentationStyle = .fullScreen
        UIView.setRootViewController(navigationController)
    }

    // MARK: - PrivateMethod
    private func bindData() {
        let displayName = (nickName?.isEmpty == false ? nickName : email) ?? "???"
        self.welcomeLabel.text = "\(displayName) 님 \n반가워요!"
    }

    // MARK: - HelperMethod
    public func dataBind(email: String?, nickName: String?) {
        self.email = email
        self.nickName = nickName
    }
}

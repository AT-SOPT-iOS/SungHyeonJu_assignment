//
//  ViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit
import SnapKit

final class ViewController: UIViewController {

    let loginButton = BoxButton(title: "로그인하기", style: .filled)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(loginButton)


        loginButton.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }


}


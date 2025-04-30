//
//  BaseUIViewController.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

class BaseUIViewController: UIViewController {

    // MARK: - Properties

    // MARK: - UI Components


    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        setUI()
        setLayout()
        addTarget()
        setDelegate()

        hideKeyboardWhenTappedAround
    }

    // MARK: - Custom Method

    func setUI() {}

    func setLayout() {}


    // MARK: - Action Method

    func addTarget() {}

    // MARK: - delegate Method

    func setDelegate() {}
}


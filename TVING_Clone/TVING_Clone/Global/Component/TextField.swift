//
//  TextField.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

final class TextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        self.font = .systemFont(ofSize: 14, weight: .medium)
        self.backgroundColor = .gray4
        self.setPlaceholder(color: .white)
        self.addLeftPadding(width: 13)
        self.layer.cornerRadius = 3
        self.autocapitalizationType = .none
        self.clearButtonMode = .always
    }
}

//
//  BaseUIView.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

class BaseUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUI() {}

    func setLayout() {}
}

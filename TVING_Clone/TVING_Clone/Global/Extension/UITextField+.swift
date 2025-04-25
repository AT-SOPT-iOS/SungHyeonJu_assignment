//
//  UITextField+.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

extension UITextField {

    /// 글자 시작위치 변경
    func addLeftPadding(width: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    /// border 설정
    func setRoundBorder() {
        layer.cornerRadius = 3
    }

    /// 기본값 외의 placeholder 색 변경시 사용하는 메소드
    func setPlaceholder(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}

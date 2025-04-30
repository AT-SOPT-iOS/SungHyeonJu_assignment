//
//  UIView+.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/1/25.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

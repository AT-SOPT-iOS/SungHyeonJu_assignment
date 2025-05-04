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

    static func setRootViewController(_ viewController: UIViewController,
                                      duration: TimeInterval = 0.4,
                                      options: UIView.AnimationOptions = .transitionCrossDissolve) {
        guard let window = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first?.windows.first else {
            return
        }

        UIView.transition(with: window,
                          duration: duration,
                          options: options,
                          animations: {
            window.rootViewController = viewController
        },
                          completion: nil)
    }
}

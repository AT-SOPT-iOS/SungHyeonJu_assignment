//
//  ImageLiterals.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

enum ImageLiterals {

    // MARK: TextField Icon
    static var icXcircle: UIImage { .load(name: "ic_xcircle")}
    static var icEyeSlash: UIImage { .load(name: "ic_eyeSlash")}

    // MARK: Logo
    static var tvingLogo: UIImage { .load(name: "tvingLogo")}
}

extension UIImage {
    static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }

    static func load(systemName: String) -> UIImage {
        guard let image = UIImage(systemName: systemName, compatibleWith: nil) else {
            return UIImage()
        }
        return image
    }
}

//
//  ImageLiterals.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

enum ImageLiterals {

    // MARK: TextField Icon
    static var ic_xcircle: UIImage { .load(name: "ic_xcircle")}
    static var ic_eyeSlash: UIImage { .load(name: "ic_eyeSlash")}

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

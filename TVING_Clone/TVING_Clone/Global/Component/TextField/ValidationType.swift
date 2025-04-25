//
//  ValidationType.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import Foundation

public enum ValidationType {
    case nonEmpty
    case email
    case minLength(Int)
    case koreanOnly

    func validate(_ text: String?) -> Bool {
        guard let text = text else { return false }

        switch self {
        case .nonEmpty:
            return !text.isEmpty
        case .email:
            let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
            return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
        case .minLength(let length):
            return text.count >= length
        case .koreanOnly:
            let regex = "^[가-힣ㄱ-ㅎㅏ-ㅣ]+$"
            return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: text)
        }
    }
}

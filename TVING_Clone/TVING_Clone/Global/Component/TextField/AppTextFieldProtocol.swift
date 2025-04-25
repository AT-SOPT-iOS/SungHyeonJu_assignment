//
//  AppTextFieldProtocol.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

// 텍스트필드가 준수하는 프로토콜

protocol AppTextFieldProtocol: AnyObject {
    var validationType: [ValidationType] { get set }
    var isValid: Bool { get }
    var textFieldPlaceholder: String? { get set }
}

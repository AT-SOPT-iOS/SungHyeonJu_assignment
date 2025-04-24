//
//  AppTextFieldProtocol.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import UIKit

protocol AppTextFieldProtocol: AnyObject {
    var validationType: [ValidationType] { get set }
    var isValid: Bool { get }
}

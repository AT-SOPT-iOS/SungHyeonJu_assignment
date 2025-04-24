//
//  AppButtonProtocol.swift
//  TVING_Clone
//
//  Created by 성현주 on 4/24/25.
//

import Foundation

//버튼이 준수하는 프로토콜입니다.
public protocol AppButtonProtocol {
    var isDisabled: Bool { get set }
    var text: String? { get set }
}

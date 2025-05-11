//
//  NetworkError.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/12/25.
//

import Foundation

enum NetworkError: Error, CustomStringConvertible {
    case invalidURL
    case requestFailed(Error)
    case decodingFailed
    case noData
    case apiError(message: String)
    case statusCodeError(code: Int)

    var description: String {
        switch self {
        case .invalidURL:
            return "유효하지 않은 URL입니다."
        case .requestFailed(let error):
            return "요청에 실패했습니다: \(error.localizedDescription)"
        case .decodingFailed:
            return "응답 디코딩에 실패했습니다."
        case .noData:
            return "서버로부터 데이터를 받지 못했습니다."
        case .apiError(let message):
            return "API 오류: \(message)"
        case .statusCodeError(let code):
            return "서버 오류 (Status code: \(code))"
        }
    }
}

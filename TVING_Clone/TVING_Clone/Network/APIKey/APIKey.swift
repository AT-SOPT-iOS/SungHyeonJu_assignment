//
//  APIKey.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/12/25.
//

import Foundation

enum AppConfig {
    static var apiKey: String {
        guard let key = Bundle.main.infoDictionary?["APIKey"] as? String else {
            fatalError("APIKey 누락")
        }
        return key
    }
}

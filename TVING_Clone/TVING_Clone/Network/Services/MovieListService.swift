//
//  MovieListService.swift
//  TVING_Clone
//
//  Created by 성현주 on 5/12/25.
//

import Foundation

final class MovieListService {
    static let shared = MovieListService()

    private init() {}

    func fetchLiveSectionWrapper(date: String) async throws -> LiveSectionWrapper {
        let request = makeRequest(date: date)
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.decodingFailed
        }

        let decoded = try JSONDecoder().decode(WeeklyBoxOfficeResponse.self, from: data)
        return LiveSectionWrapper(from: decoded)
    }

    private func makeRequest(date: String) -> URLRequest {
        var components = URLComponents(string: "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.json")!
        components.queryItems = [
            URLQueryItem(name: "key", value: AppConfig.apiKey),
            URLQueryItem(name: "targetDt", value: date)
        ]
        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        return request
    }
}

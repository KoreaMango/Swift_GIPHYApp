//
//  APIManager.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation
import Combine


protocol ServiceProtocol {
    func request(q : String, selection: gifOrSticker) -> AnyPublisher<Data, NetworkError>
}

class DataManager {
    // MARK: - 변수
    // 싱글톤으로 API 가져오기
    public static let shared = DataManager()
    
}

extension DataManager: ServiceProtocol {
    func request(q : String, selection: gifOrSticker) -> AnyPublisher<Data, NetworkError>{
        let url = Parsing.shared.getURL(q: q, selection: selection)!
    
        return URLSession.shared
                .dataTaskPublisher(for: url)
                .tryMap() { data, response -> Data in
                    guard let httpResponse = response as? HTTPURLResponse,
                        httpResponse.statusCode == 200 else {
                            throw URLError(.badServerResponse)
                        }
                        return data
                    }
                .mapError({ error -> NetworkError in
                        .unknownError(message: error.localizedDescription)
                })
                .eraseToAnyPublisher()
    }
}


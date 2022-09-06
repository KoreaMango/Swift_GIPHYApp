//
//  APIManager.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation
import Combine

import Alamofire

protocol ServiceProtocol {
    func fetchImages() -> AnyPublisher<DataResponse<ResponseDatas, APIError>, Never> 
}

class APIManager {
    // MARK: - 변수
    // 싱글톤으로 API 가져오기
    public static let shared = APIManager()
    // Info에 있는 API_KEY 들고오기
    private let apiKeyOptional = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    private init() {}
}

extension APIManager: ServiceProtocol {
    func fetchImages() -> AnyPublisher<DataResponse<ResponseDatas, APIError>, Never> {
        <#code#>
    }
    
    
   
}

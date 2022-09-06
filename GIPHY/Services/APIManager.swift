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
    
    
    // MARK: - Function
    
    func getURL(q: String, limit: Int = 25 , offset : Int = 0 , rating : String = "g", lang: String = "en", selection: gifOrSticker) -> String{
        var finalURL : String = ""
        if let apiKey = apiKeyOptional {
            // Picker의 선택에 따라서 URL이 바뀜
            if selection == .StickerMode{
                finalURL = "\(AppConstant.serverURL)\(AppConstant.nextURL.stickerURL)" + "?api_key=" + "\(apiKey)" + "&q=" + "\(q)" +
                "&limit=" + "\(limit)" + "&offset=" + "\(offset)" + "&rating=" + "\(lang)" + "&lang=" + "\(lang)"
            } else {
                finalURL = "\(AppConstant.serverURL)\(AppConstant.nextURL.gifURL)" + "?api_key=" + "\(apiKey)" + "&q=" + "\(q)" +
                "&limit=" + "\(limit)" + "&offset=" + "\(offset)" + "&rating=" + "\(lang)" + "&lang=" + "\(lang)"
            }
        }
        return finalURL
    }
   
}

//
//  APIManager.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation
import Alamofire

class APIManager {
    // 싱글톤으로 API 가져오기
    public static let shared = APIManager()
    
    // Info에 있는 API_KEY 들고오기
    private let apiKeyOptional = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    // 최종 URL이 담기는 변수
    var finalURL : String = ""
    
    // API 값을 들고오는 함수 (검색어 빼고 고정값을 입력함)
    func callAPI(q: String, limit: Int = 25 , offset : Int = 0 , rating : String = "g", lang: String = "en", selection: gifOrSticker, completion : @escaping (ResponseDatas?) -> Void) {
        
        // apiKey가 있다면 FinalURL을 만들어줌
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
        
        // AF를 사용해서 URL로 API를 요청
        let request = AF.request(finalURL)
        request
            .validate()
            // 응답을 Decode까지 해서 데이터로 받아옴
            .responseDecodable(of: ResponseDatas.self){ response in
                switch response.result{
                case .success:
                    completion(response.value ?? nil)
                case .failure(let err):
                    print(err)
                }
            }
        
        
    }
    
    
}

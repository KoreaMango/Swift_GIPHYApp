//
//  APIManager.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation
import Alamofire

class APIManager {
    public static let shared = APIManager()
    
    private let apiKeyOptional = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    var finalURL : String = ""
    
    func callAPI(q: String, limit: Int = 25 , offset : Int = 0 , rating : String = "g", lang: String = "en", selection: gifOrSticker, completion : @escaping (ResponseDatas?) -> Void) {
        
        
        if let apiKey = apiKeyOptional {
            if selection == .StickerMode{
                finalURL = "\(AppConstant.serverURL)\(AppConstant.nextURL.stickerURL)" + "?api_key=" + "\(apiKey)" + "&q=" + "\(q)" +
                "&limit=" + "\(limit)" + "&offset=" + "\(offset)" + "&rating=" + "\(lang)" + "&lang=" + "\(lang)"
            } else {
                finalURL = "\(AppConstant.serverURL)\(AppConstant.nextURL.gifURL)" + "?api_key=" + "\(apiKey)" + "&q=" + "\(q)" +
                "&limit=" + "\(limit)" + "&offset=" + "\(offset)" + "&rating=" + "\(lang)" + "&lang=" + "\(lang)"
            }
        }
        
        
        let request = AF.request(finalURL)
        request
            .validate()
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

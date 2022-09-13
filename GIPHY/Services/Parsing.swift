//
//  Parsing.swift
//  GIPHY
//
//  Created by 강민규 on 2022/09/13.
// https://api.giphy.com/v1/gifs/search?api_key=NFQ2eIrVoMizU1r3gqG0aHrPWjheFyQg&q=Gg&limit=25&offset=0&rating=en&lang=en

import Foundation

struct Parsing {
    // 싱글톤 객체
    static let shared = Parsing()
    // Info에 있는 API_KEY 들고오기
    private let apiKeyOptional = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String
    
    
    func getURL(q: String, limit: Int = 25 , offset : Int = 0 , rating : String = "g", lang: String = "en", selection: gifOrSticker) -> URL?{
        guard let apiKey = apiKeyOptional else {return nil}
        
        var components : URLComponents?
        
        if selection == .StickerMode {
            components = URLComponents(string: "\(AppConstant.serverURL)\(AppConstant.nextURL.stickerURL)")
        } else {
            components = URLComponents(string: "\(AppConstant.serverURL)\(AppConstant.nextURL.gifURL)")
        }
        
        let apiKeyItem = URLQueryItem(name: "api_key", value: apiKey)
        let qItem = URLQueryItem(name: "q", value: q)
        let limitItem = URLQueryItem(name: "limit", value: "\(limit)")
        let offsetItem = URLQueryItem(name: "offset", value: "\(offset)")
        let ratingItem = URLQueryItem(name: "rating", value: "\(rating)")
        let langItem = URLQueryItem(name: "lang", value: "\(lang)")
        
        components?.queryItems = [apiKeyItem, qItem, limitItem, offsetItem, ratingItem, langItem]
        
        let finalURL = components?.url
        
        return finalURL
    }
}

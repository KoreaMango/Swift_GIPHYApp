//
//  AppConstant.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

struct AppConstant {
    // 서버에서 데이터를 들고오기 위한 BaseURL
    static let serverURL : String = "https://api.giphy.com/v1"
    
    // BaseURL 다음으로 Picker에 의해 갈라지는 2개의 URL
    enum nextURL{
        static let gifURL : String = "/gifs/search"
        static let stickerURL : String = "/stickers/search"
    }
}

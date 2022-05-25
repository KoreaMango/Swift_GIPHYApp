//
//  AppConstant.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

struct AppConstant {
    static let serverURL : String = "api.giphy.com/v1"
    
    enum nextURL{
        static let gifURL : String = "/gifs/search"
        static let Sticker : String = "/stickers/search"
    }
}

//
//  FavoriteModel.swift
//  GIPHY
//
//  Created by 강민규 on 2022/09/17.
//

import Foundation

struct FavoriteUDS: Codable {
    var list : [FavoriteModel]
}

struct FavoriteModel : Codable{
    var responseData : ResponseData
    var isFavorite : Bool
    
    init(responseData: ResponseData) {
        self.responseData = responseData
        self.isFavorite = false
    }
}

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
    var id : [String : Bool] = [:]
    
    init(responseData: ResponseData) {
        self.id.updateValue(false, forKey: responseData.id)
    }
}

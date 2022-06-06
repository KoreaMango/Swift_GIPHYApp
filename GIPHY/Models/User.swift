//
//  User.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

// MARK: - 응답받을 데이터인 ResponseData의 user의 모델
struct User: Decodable{
    var avatar_url: String
    var banner_url: String
    var profile_url: String
    var username: String
    var display_name: String
    
    enum CodingKeys : String, CodingKey{
        case avatar_url
        case banner_url
        case profile_url
        case username
        case display_name
    }
}

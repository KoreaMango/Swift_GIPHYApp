//
//  Model.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

//MARK: - Decode된 Json이 Type에 맞게 파싱된 배열
struct ResponseDatas: Decodable{
    let all: [ResponseData]?
    
    enum CodingKeys: String, CodingKey{
        case all = "data"
    }
}
// MARK: - 요청을 할 때 사용되는 모델
//struct RequestData {
//    var api_key : String
//    var query : String
//    var limit : Int
//    var offset : Int
//    var rating : String
//    var lang : String
//    var random_id : String
//    var bundle : String
//}

// MARK: - 응답 받을 때 사용되는 모델
struct ResponseData: Codable, Identifiable{
    var type: String
    var id : String
    var slug: String
    var url : String
    var bitly_url: String
    var embed_url: String
    var username: String
    var source: String
    var rating: String
    var content_url: String
    var user : User?
    var is_sticker : Int
    var source_tld: String
    var source_post_url : String
    var import_datetime: String
    var trending_datetime: String
    let images: URLImage?
    var title: String
    
    // Decode 하기 위해 사용되는 CodingKeys
    enum CodingKeys: String, CodingKey {
        case type
        case id
        case slug
        case url
        case bitly_url
        case embed_url
        case username
        case source
        case rating
        case content_url
        case user
        case is_sticker
        case source_tld
        case source_post_url
        case import_datetime
        case trending_datetime
        case images
        case title
    }
    
    // Decoder에 직접 Decode
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        type = try values.decode(String.self, forKey: .type)
         id = try values.decode(String.self, forKey: .id)
         slug = try values.decode(String.self, forKey: .slug)
         url = try values.decode(String.self, forKey: .url)
         bitly_url = try values.decode(String.self, forKey: .bitly_url)
         embed_url = try values.decode(String.self, forKey: .embed_url)
         username = try values.decode(String.self, forKey: .username)
         source = try values.decode(String.self, forKey: .source)
         rating = try values.decode(String.self, forKey: .rating)
        content_url = try values.decode(String.self, forKey: .content_url)
        user = try? values.decode(User.self, forKey: .user)
         is_sticker = try values.decode(Int.self, forKey: .is_sticker)
         source_tld = try values.decode(String.self, forKey: .source_tld)
         source_post_url = try values.decode(String.self, forKey: .source_post_url)
         import_datetime = try values.decode(String.self, forKey: .import_datetime)
         trending_datetime = try values.decode(String.self, forKey: .trending_datetime)
         images = try? values.decode(URLImage.self, forKey: .images)
         title = try values.decode(String.self, forKey: .title)
    }
}



//
//  Model.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

struct RequestData {
    var api_key : String
    var query : String
    var limit : Int
    var offset : Int
    var rating : String
    var lang : String
    var random_id : String
    var bundle : String
}

struct ResponseData{
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
    var user : User
    var is_sticker : Int
    var source_tId: String
    var source_post_url : String
    var update_datetime: String
    var create_datetime: String
    var import_datetime: String
    var trending_datetime: String
    var images: Images
    var title: String
}

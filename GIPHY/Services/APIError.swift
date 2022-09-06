//
//  APIError.swift
//  GIPHY
//
//  Created by 강민규 on 2022/09/06.
//

import Foundation

enum APIError: Error {
    case error(String)
    case defaultError
    
    var message: String? {
        switch self {
        case let .error(msg):
            return msg
        case .defaultError:
            return "기본 에러 발생"
        }
    }
}


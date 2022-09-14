//
//  NetworkError.swift
//  GIPHY
//
//  Created by 강민규 on 2022/09/14.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case unknownError(message: String)
}

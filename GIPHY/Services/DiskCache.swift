//
//  DiskCache.swift
//  GIPHY
//
//  Created by 강민규 on 2022/09/17.
//

import Foundation

protocol DiskCacheProtocol {
    func addData(id : String, isFavorite : Bool)
    func fetchData(id : String) -> Bool
}


final class DiskCache {
    static var shared = DiskCache()
    private var userDefaults : UserDefaults
    
    init (userDefaults : UserDefaults = UserDefaults.standard){
        self.userDefaults = userDefaults
    }
    
    func printObj() {
        for (key, value) in userDefaults.dictionaryRepresentation() {
           print("\(key) = \(value) \n")
         }
    }
}

extension DiskCache : DiskCacheProtocol {
    /// isFavorite 가져오기
    func fetchData(id : String) -> Bool {
        let result = userDefaults.bool(forKey: id)
        
        return result
    }
    
    /// isFavorite 저장하기
    func addData(id : String, isFavorite : Bool) {
        userDefaults.setValue(isFavorite, forKey: id)
    }
}

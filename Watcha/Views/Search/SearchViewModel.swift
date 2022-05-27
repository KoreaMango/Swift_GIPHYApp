//
//  SearchViewModel.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

class SearchViewModel : ObservableObject{
    // MARK: - 변수
    // TextField 로 실시간으로 바뀌는 변수
    @Published var searchTextField : String = ""
    
    // API로 서버에서 들고온 데이터를 저장
    @Published var items : ResponseDatas?
    
    // MARK: - API Function
    // Picker의 상태변수에 따라서 들고오는 API
    func getResult(selection: gifOrSticker, limit: Int) {
        APIManager.shared.callAPI(q: searchTextField,limit: limit, selection: selection) { result in
            if let result = result {
                self.items = result
            }
        }
    }
    
    func itemsInit (){
        self.items = nil
    }
    
    // MARK: - Local Data Function
    func isFavoriteData(id : String) -> Bool{
        // 로컬의 데이터를 들고온다.
        // 현재 DetailView에 있는 Image의 ID 값을 로컬 데이터에서 검색한다.
        
            // 검색이 되면 좋아요가 눌러진 상태
                // true를 return 한다.
            // 검색이 안되면 좋아요가 안눌러진 상태
                // false를 return 한다.
        
        /// 임의 값
        return true
    }
    
    func saveData (id : String) {
        // 현재 Detail View의 Image의 Id 값을 사용해서 ReponseData 타입으로 로컬 JSON에 저장한다.
    }
    
    func deleteData(id : String){
        // 현재 Detail View의 Image의 Id 값을 사용해서 Index 값을 찾는다.
        
        // Index 값을 사용해서 데이터를 삭제한다.
    }
}

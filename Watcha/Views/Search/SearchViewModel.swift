//
//  SearchViewModel.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

class SearchViewModel : ObservableObject{
    // TextField 로 실시간으로 바뀌는 변수
    @Published var searchTextField : String = ""
    
    // API로 서버에서 들고온 데이터를 저장
    @Published var items : ResponseDatas?
    
    // Picker의 상태변수에 따라서 들고오는 API
    func getResult(selection: gifOrSticker, limit: Int) {
        APIManager.shared.callAPI(q: searchTextField,limit: limit, selection: selection) { result in
            if let result = result {
                self.items = result
            }
        }
    }
    
    
}

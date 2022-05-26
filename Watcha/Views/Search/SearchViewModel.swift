//
//  SearchViewModel.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import Foundation

class SearchViewModel : ObservableObject{
    @Published var searchTextField : String = ""
    @Published var items : ResponseDatas?
    
    func getResult(selection: gifOrSticker) {
        APIManager.shared.callAPI(q: searchTextField, selection: selection) { result in
            if let result = result {
                self.items = result
                print(self.items as Any)
            }
        }
    }
}

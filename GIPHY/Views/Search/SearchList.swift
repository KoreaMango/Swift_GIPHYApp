//
//  SearchList.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchList: View {
    // MARK: - 변수
    /// Data를 들고오기 위한 ViewModel
    @StateObject var searchViewModel = SearchViewModel()
    
    /// Picker 상태 변수
    @State private var selectCase : gifOrSticker = .GIFMode
    
    /// 읽어오는 글 수
    @State private var limit : Int = 25

    
    // MARK: - View
    var body: some View {
        VStack{
            // 검색바 View
            SearchBar(selectCase: $selectCase, limit: $limit)
                .environmentObject(searchViewModel)
            
            // 이미지 종류 Picker
            ModePicker(limit: $limit, selectCase: $selectCase)
                .environmentObject(searchViewModel)
            
            // 검색 결과 View
            SearchResult()
                .environmentObject(searchViewModel)

            
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)

    }
    

}

// MARK: - Previews
struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchList()
    }
}

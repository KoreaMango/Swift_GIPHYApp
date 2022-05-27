//
//  SearchList.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchList: View {
    // Data를 들고오기 위한 ViewModel
    @StateObject var searchViewModel = SearchViewModel()
    
    // Picker 상태 변수
    @State private var selectCase : gifOrSticker = .GIFMode
    
    // 읽어오는 글 수
    @State private var limit : Int = 25
    
    // 버튼을 클릭했는지 여부
    @State private var isClicked: Bool = false
    
    var body: some View {
        VStack{
            // 검색바 View
            SearchBar(selectCase: $selectCase, limit: $limit,isClicked: $isClicked)
                .environmentObject(searchViewModel)
            
            // 이미지 종류 Picker
            ModePicker(limit: $limit, selectCase: $selectCase)
                .environmentObject(searchViewModel)
            
            // 사진 List
            if selectCase == .GIFMode {
                SearchResult()
                    .environmentObject(searchViewModel)
            } else if selectCase == .StickerMode{
                SearchResult()
                    .environmentObject(searchViewModel)
            }
            
        }
///      iOS 14 이상부터 아래 코드
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
///      iOS 13 ~ 14
//        .navigationBarTitle("Search",displayMode: .inline)

    }
    

}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchList()
    }
}

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
    @State var selectCase : gifOrSticker = .GIFMode
    
    // 읽어오는 글 수
    @State var limit : Int = 25
    
    var body: some View {
        VStack{
            // 검색바 View
            SearchBar(selectCase: $selectCase, limit: $limit)
                .environmentObject(searchViewModel)
            
            // 이미지 종류 Picker
            ModePicker(selectCase: $selectCase)
            
            
            // 사진 List
            ScrollView{
                if let items = searchViewModel.items {
                    if let all = items.all {
                        ForEach(all){ item in
                            if let url = item.images?.original.url{
                                AsyncImage(url: URL(string: url)){ phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } else if phase.error != nil {
                                        Text("No Image")
                                    } else {
                                        ProgressView()
                                    }
                                }
                                .frame(height: 200, alignment: .center)
                                
                                
                            }
                        }
                    }
                }
                
            }
            
        }
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchList()
    }
}

//
//  SearchResult.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/26.
//

import SwiftUI
import Alamofire

struct SearchResult: View {
    // MARK: - 변수
    // SearchList에서 받아온 ViewModel을 환경 변수로 이어 받음
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    
    // MARK: - View
    var body: some View {
        ScrollView{
            // API로 들고온 배열 옵셔널 바인딩
            if let items = searchViewModel.items {
                    ForEach(items){ item in
                        // ResponseData에서 URL 추출
                        let url = searchViewModel.getImageURL(item: item)
                        NavigationLink{
                            SearchDetail(id: item.id, url: url)
                                .environmentObject(searchViewModel)
                        } label:{
                            URLImageView(url: url)
                    }
                }
            }
        }
    }
    
    // MARK: - Function
}


// MARK: - Previews
struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult()
    }
}

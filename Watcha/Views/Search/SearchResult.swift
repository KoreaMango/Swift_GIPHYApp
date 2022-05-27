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
                if let all = items.all {
                    ForEach(all){ item in
                        // ResponseData에서 URL 추출
                        let url = getURL(item: item)
                        NavigationLink{
                            SearchDetail(id: item.id)
                                .environmentObject(searchViewModel)
                        } label:{
                            /// iOS 15 +
                            /// 비동기 Image View
                            AsyncImage(url: url){ phase in
                                // phase에 image가 있으면
                                if let image = phase.image {
                                    image
                                        .resizable()
                                        .scaledToFit()
                                }
                                // error 가 발생하면
                                else if phase.error != nil {
                                    Text("No Image")
                                }
                                // 들고오는 중이면 ProgressView
                                else {
                                    /// iOS 14 +
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
    
    // MARK: - Function
    // ResponseData에서 URL만 추출하는 함수
    func getURL(item: ResponseData) -> URL?{
        if let url = item.images?.original.url{
            return URL(string: url)
        }
        return nil
    }
}


// MARK: - Previews
struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult()
    }
}

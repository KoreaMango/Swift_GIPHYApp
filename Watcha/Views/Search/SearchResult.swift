//
//  SearchResult.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/26.
//

import SwiftUI

struct SearchResult: View {
    // SearchList에서 받아온 ViewModel을 환경 변수로 이어 받음
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    // SearchList에서 만든 Picker 상태 변수를 Binding
    @Binding var selectCase : gifOrSticker
    
    var body: some View {
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
}

struct SearchResult_Previews: PreviewProvider {
    static var previews: some View {
        SearchResult(selectCase: .constant(.GIFMode))
    }
}

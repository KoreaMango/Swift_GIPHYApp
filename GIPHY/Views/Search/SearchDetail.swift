//
//  SearchDetail.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchDetail: View {
    // MARK: - 변수
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    var id : String
    var url : URL?

    // MARK: - View
    var body: some View {
        VStack{
            // 좋아요 버튼
            FavoriteButton(id: id)
                .environmentObject(searchViewModel)

            URLImageView(url: url)
            Spacer()
        }
    }
}

// MARK: - Previews
struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetail(id: "", url: nil)
    }
}

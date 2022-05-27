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

    // MARK: - View
    var body: some View {
        VStack{
            // 좋아요 버튼
            FavoriteButton(id: id)
                .environmentObject(searchViewModel)
            
            // item의 id 값과 선택된 id 값이 같으면
            if let index = searchViewModel.items?.all!.firstIndex(where: {$0.id == id}){
                AsyncImage(url: URL(string : searchViewModel.items!.all![index].images!.original.url)!) {phase in
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
            }
            Spacer()
        }
    }
}

// MARK: - Previews
struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetail(id: "")
    }
}

//
//  FavoriteButton.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/27.
//

import SwiftUI

struct FavoriteButton: View {
    // MARK: - 변수
    // SearchList에서부터 받아온 ViewModel의 환경 변수
    @EnvironmentObject var searchViewModel : SearchViewModel
    
    // 좋아요 상태 변수
    @State private var isFavorite : Bool = false
 
    // SearchResult에서 클릭한 Image ID
    var id : String
    
    // MARK: - View
    var body: some View {
        VStack{
            Toggle ("Favorite", isOn: $isFavorite)
                .onChange(of: isFavorite){ isOn in
                    if isOn {
                        searchViewModel.onFavorite(id: id)
                    } else {
                        searchViewModel.offFavorite(id: id)
                    }
                }
                .padding()
        }.onAppear{
            // 화면이 나타날 때 로컬 데이터에 해당 이미지의 id 값이 있는지 확인한다.
            isFavorite = searchViewModel.haveFavorite(id: id)
        }
    }
}

// MARK: - Previews
struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(id: "")
    }
}

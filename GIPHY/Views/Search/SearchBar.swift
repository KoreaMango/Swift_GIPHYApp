//
//  Search.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchBar: View {
    // MARK: - 변수
    /// SearchList에서 받아온 ViewModel을 환경 변수로 이어 받음
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    /// SearchList에서 만든 Picker 상태 변수를 Binding
    @Binding var selectCase : gifOrSticker
    
    /// 읽어오는 글 수
    @Binding var limit : Int

    
    // MARK: - View
    var body: some View {
        HStack{
            // TextField로 ViewModel의 변수와 연동
            TextField("Search GIPHY",text: $searchViewModel.searchTextField)
                .padding(.leading)
                
            Spacer()
            
            // Button 클릭시 ViewModel의 getResult함수 실행
            Button(action: {
                searchViewModel
                    .getDataList(selection: selectCase, limit: limit)
                
            })
            {
                Image(systemName: "magnifyingglass")
            }
            .padding()
            .foregroundColor(.white)
            .background(
                Rectangle()
                    .foregroundColor(.pink)
            )
        }
    }
}

// MARK: - Previews
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(selectCase: .constant(.GIFMode), limit: .constant(25))
            .environmentObject(SearchViewModel())
    }
}

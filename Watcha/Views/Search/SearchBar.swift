//
//  Search.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    @Binding var selectCase : gifOrSticker
    
    var body: some View {
        HStack{
            TextField("Search GIPHY",text: $searchViewModel.searchTextField)
                .padding(.leading)
                
            Spacer()
            Button(action: {
                searchViewModel.getResult(selection: selectCase)
            }){
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(selectCase: .constant(.GIFMode))
            .environmentObject(SearchViewModel())
    }
}

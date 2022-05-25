//
//  Search.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchBar: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    var body: some View {
        HStack{
            TextField("Search GIPHY",text: $searchViewModel.searchTextField)
                .padding(.leading)
                
            Spacer()
            Button(action: {
                searchViewModel.callAPI()
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
        SearchBar()
            .environmentObject(SearchViewModel())
    }
}

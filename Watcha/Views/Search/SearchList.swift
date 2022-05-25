//
//  SearchList.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchList: View {
    @StateObject var searchViewModel = SearchViewModel()
    
    var body: some View {
        VStack{
            SearchBar()
                .environmentObject(searchViewModel)
            modePicker()
            List {
                
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

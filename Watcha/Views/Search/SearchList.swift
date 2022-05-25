//
//  SearchList.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchList: View {
    @StateObject var searchViewModel = SearchViewModel()
    @State var selectCase : gifOrSticker = .GIFMode
    
    var body: some View {
        VStack{
            SearchBar(selectCase: $selectCase)
                .environmentObject(searchViewModel)
            modePicker(selectCase: $selectCase)
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

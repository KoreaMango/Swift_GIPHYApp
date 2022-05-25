//
//  SearchList.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchList: View {
    var body: some View {
        VStack{
            SearchBar()
            Spacer()
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

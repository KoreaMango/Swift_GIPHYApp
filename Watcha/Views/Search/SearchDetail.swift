//
//  SearchDetail.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct SearchDetail: View {
    @EnvironmentObject var searchViewModel: SearchViewModel
    
    var id : String
    
    var body: some View {
        if let index = searchViewModel.items?.all?.firstIndex(where: {$0.id == id}){
            AsyncImage(url: URL(string : searchViewModel.items!.all![index].images!.original.url)!)
        }
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetail(id: "" )
    }
}

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
        VStack{
            FavoriteButton( id: id)
                .environmentObject(searchViewModel)
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
        }
    }
}

struct SearchDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDetail(id: "")
    }
}

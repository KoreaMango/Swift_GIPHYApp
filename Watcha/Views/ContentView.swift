//
//  ContentView.swift
//  Watcha
//
//  Created by 강민규 on 2022/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // 검색화면으로 가는 버튼
        NavigationView{
            NavigationLink{
                SearchList()
            } label:{
                Text("Search")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
